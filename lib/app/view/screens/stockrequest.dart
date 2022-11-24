import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import '../../controller/extensions.dart';
import '../../core/app_colors.dart';
import '../widgets/errormsgbox.dart';

class StockRequest extends StatefulWidget {
  const StockRequest({
    super.key,
  });

  @override
  State<StockRequest> createState() => _StockRequestState();
}

class _StockRequestState extends State<StockRequest> {
  TextEditingController dateInput = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  final addvalue = TextEditingController();
  final addRemark = TextEditingController();

  @override
  void dispose() {
    addvalue.dispose();
    super.dispose();
  }

  String? selectedItem;
  var unitvlu = "";

  void Findstate() {
    getDropdownLite().map((e) {
      if (getmaterialname(e["materialId"]).toString() == selectedItem) {
        setState(() {
          unitvlu = getUnitbyID(e["materialId"]).toString();
        });
      }
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          color: AppColor.highlightclr,
          height: 5,
          width: double.infinity,
        ),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            "Enter Date",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          child: TextField(
            controller: dateInput,
            cursorColor: AppColor.themeColor,
            decoration: InputDecoration(
              hintText: "Enter Date",
              icon:
                  const Icon(Icons.calendar_today, color: AppColor.themeColor),
              contentPadding: const EdgeInsets.all(8),
              filled: true,
              fillColor: AppColor.inputbgclr,
              enabledBorder: UnderlineInputBorder(
                borderSide: const BorderSide(
                  color: AppColor.inputbgclr,
                ),
                borderRadius: BorderRadius.circular(4.0),
              ),
              focusedBorder: const UnderlineInputBorder(
                borderSide:
                    BorderSide(color: Color.fromARGB(255, 255, 255, 255)),
              ),
            ),
            readOnly: true,
            onTap: () async {
              DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime(2100));

              if (pickedDate != null) {
                String formattedDate =
                    DateFormat('dd-MM-yyyy').format(pickedDate);
                setState(() {
                  dateInput.text = formattedDate;
                });
              } else {}
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                child: Text(
                  "Material Description",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    // fontSize: 20,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.only(right: 40, left: 10),
                decoration: BoxDecoration(
                    color: AppColor.inputbgclr,
                    borderRadius: BorderRadius.circular(4)),
                child: DropdownButton<String>(
                  value: selectedItem,
                  focusColor: AppColor.inputbgclr,
                  onChanged: (value) {
                    setState(() {
                      selectedItem = value;
                      Findstate();
                    });
                  },
                  hint: const Center(
                      child: Text(
                    'Select the Material',
                    style: TextStyle(color: Colors.black),
                  )),
                  underline: Container(),
                  dropdownColor: AppColor.inputbgclr,
                  icon: const Icon(
                    Icons.keyboard_arrow_down,
                    color: Colors.black,
                  ),
                  isExpanded: true,
                  items: getDropdownLite().map((e) {
                    return DropdownMenuItem(
                        value: getmaterialname(e["materialId"]).toString(),
                        child: Container(
                          // margin: EdgeInsets.all(value),
                          alignment: Alignment.centerLeft,

                          child: Text(
                            getmaterialname(e["materialId"]).toString(),
                            style: const TextStyle(
                                // fontSize: 20,
                                ),
                          ),
                        ));
                  }).toList(),
                  selectedItemBuilder: (BuildContext context) =>
                      getDropdownLite().map((e) {
                    return Center(
                      child: Text(
                        getmaterialname(e["materialId"]).toString(),
                        style: const TextStyle(
                          // fontSize: 20,
                          color: Colors.black,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            "Unit",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              // fontSize: 20,
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(
                              vertical: 11.2,
                            ),
                            margin: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 8),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4.0),
                                color: AppColor.inputbgclr),
                            child: Text(
                              unitvlu.toString(),
                              textAlign: TextAlign.center,
                              // style: TextStyle(fontSize: 20),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 10,
                            ),
                            child: Text(
                              "Required Qty.",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                // fontSize: 20,
                              ),
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            margin: const EdgeInsets.symmetric(
                                vertical: 8, horizontal: 18),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4.0),
                                color: AppColor.inputbgclr),
                            child: TextField(
                              controller: addvalue,
                              textAlign: TextAlign.left,
                              keyboardType: TextInputType.number,
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: AppColor.inputbgclr,
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: AppColor.inputbgclr),
                                  borderRadius: BorderRadius.circular(4.0),
                                ),
                                focusColor: Colors.black,
                                focusedBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color:
                                          Color.fromARGB(255, 255, 255, 255)),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Enter Remark",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextField(
                      controller: addRemark,
                      textAlign: TextAlign.left,
                      maxLines: 3,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: AppColor.inputbgclr,
                        enabledBorder: UnderlineInputBorder(
                          borderSide:
                              const BorderSide(color: AppColor.inputbgclr),
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        focusColor: Colors.black,
                        focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 255, 255, 255)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              if (selectedItem != null)
                Padding(
                    padding: const EdgeInsets.only(bottom: 150),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        InkWell(
                          onTap: () {
                            errormsgbox(context, "The request is successful");

                            // c.addBlastingRequest.clear();
                          },
                          // ignore: prefer_const_constructors
                          child: Card(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 10),
                            color: AppColor.themeColor,
                            child: const Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 25, vertical: 15),
                              child: Text(
                                "Register",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              addvalue.text = "";
                              addRemark.text = "";
                            });
                          },
                          child: const Card(
                            margin: EdgeInsets.symmetric(
                                horizontal: 15, vertical: 10),
                            color: AppColor.highlightclr,
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 25, vertical: 15),
                              child: Text(
                                "Cancel",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ))
            ],
          ),
        ),
      ],
    );
  }
}
