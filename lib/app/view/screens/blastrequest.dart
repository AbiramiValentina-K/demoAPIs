import 'package:blaster/app/view/widgets/errormsgbox.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../controller/controller.dart';
import '../../controller/extensions.dart';
import '../../core/app_colors.dart';
import '../../model/models.dart';

class BlastRuest extends StatefulWidget {
  const BlastRuest({super.key});

  @override
  State<BlastRuest> createState() => _BlastRuestState();
}

class _BlastRuestState extends State<BlastRuest> {
  final Controller c = Get.put(Controller());
  @override
  void initState() {
    dateInput.text = "";
    super.initState();
  }

  @override
  void dispose() {
    addvalue.dispose();
    super.dispose();
  }

//
  TextEditingController dateInput = TextEditingController();
  List idlist = [
    "face1",
    "face2",
    "face3",
  ];
  List siftList = ["Day", "Night"];

  //
  String? selectedItem;
  String? selectedID;
  String? selectedSift;

//

//temp values
  var unitvlu;
  var availablevlu;
  var materialid;
  final addvalue = TextEditingController();

  void Findstate() {
    getDropdownLite().map((e) {
      if (getmaterialname(e["materialId"]).toString() == selectedItem) {
        setState(() {
          materialid = e["materialId"];
          unitvlu = getUnitbyID(e["materialId"]).toString();
          availablevlu = getQtybyID(e["materialId"]).toString();
        });
      }
    }).toList();
  }

  requestDelete(id) {
    setState(() {
      for (var i = 0; i < c.addBlastingRequest.length; i++) {
        if (c.addBlastingRequest[i].materialId == id) {
          int index = i;
          c.addBlastingRequest.removeAt(index);
        }
      }
    });
  }

  updateList() {
    if (selectedID != null &&
        selectedItem != null &&
        selectedSift != null &&
        dateInput.text != "" &&
        addvalue.text != "") {
      if (int.parse(availablevlu) > int.parse(addvalue.text) &&
          int.parse(availablevlu) != 0) {
        if (c.addBlastingRequest.isEmpty) {
          setState(() {
            c.addBlastingRequest.add(BlateRequest(
                date: dateInput.text,
                shift: selectedSift,
                tunnelID: selectedID,
                materialId: materialid,
                addQty: addvalue.text));
          });
        } else if (c.addBlastingRequest
            .any((value) => value.materialId == materialid)) {
          errormsgbox(context, "Material Already Added In List");
        } else {
          setState(() {
            c.addBlastingRequest.add(BlateRequest(
                date: dateInput.text,
                shift: selectedSift,
                tunnelID: selectedID,
                materialId: materialid,
                addQty: addvalue.text));
          });
        }
      } else if (int.parse(availablevlu) != 0) {
        errormsgbox(context, "Please Enter Qty  Less Than $availablevlu");
      } else {
        errormsgbox(context, "Please Enter Valid Qty");
      }
    } else {
      errormsgbox(context, "Please Enter Valid Inputs");
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Obx(
      () => Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: AppColor.highlightclr,
            height: 5,
            width: double.infinity,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                        flex: 2,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 18, vertical: 5),
                              child: Text(
                                "Enter Date",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            TextField(
                              controller: dateInput,
                              cursorColor: AppColor.themeColor,
                              decoration: InputDecoration(
                                hintText: "Enter Date",
                                icon: const Icon(Icons.calendar_today,
                                    color: AppColor.themeColor),
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
                                  borderSide: BorderSide(
                                      color:
                                          Color.fromARGB(255, 255, 255, 255)),
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
                                      DateFormat('dd-MM-yyyy')
                                          .format(pickedDate);
                                  setState(() {
                                    dateInput.text = formattedDate;
                                  });
                                } else {}
                              },
                            ),
                          ],
                        ),
                      ),
                      Flexible(
                        flex: 2,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 25, vertical: 5),
                              child: Text(
                                "Shift",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4.0),
                                  color: AppColor.inputbgclr),
                              child: DropdownButton<String>(
                                value: selectedSift,
                                focusColor: AppColor.inputbgclr,
                                onChanged: (value) {
                                  setState(() {
                                    selectedSift = value;
                                  });
                                },
                                hint: const Center(
                                    child: Text(
                                  'Select',
                                  style: TextStyle(color: Colors.black),
                                )),
                                underline: Container(),
                                dropdownColor: AppColor.inputbgclr,
                                icon: const Icon(
                                  Icons.keyboard_arrow_down,
                                  color: Colors.black,
                                ),
                                isExpanded: true,
                                items: siftList.map((e) {
                                  return DropdownMenuItem(
                                    value: e.toString(),
                                    child: Container(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        e.toString(),
                                      ),
                                    ),
                                  );
                                }).toList(),
                                selectedItemBuilder: (BuildContext context) =>
                                    siftList.map((e) {
                                  return Center(
                                    child: Text(
                                      e.toString(),
                                      style: const TextStyle(
                                        color: Colors.black,
                                      ),
                                    ),
                                  );
                                }).toList(),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                        flex: 2,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.symmetric(vertical: 8),
                              child: Text(
                                "Tunnel Face Id",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4.0),
                                  color: AppColor.inputbgclr),
                              child: DropdownButton<String>(
                                value: selectedID,
                                focusColor: AppColor.inputbgclr,
                                onChanged: (value) {
                                  setState(() {
                                    selectedID = value;
                                  });
                                },
                                hint: const Center(
                                    child: Text(
                                  'Select Tunnel Face Id',
                                  style: TextStyle(color: Colors.black),
                                )),
                                underline: Container(),
                                dropdownColor: AppColor.inputbgclr,
                                icon: const Icon(
                                  Icons.keyboard_arrow_down,
                                  color: Colors.black,
                                ),
                                isExpanded: true,
                                items: idlist.map((e) {
                                  return DropdownMenuItem(
                                    value: e.toString(),
                                    child: Container(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        e.toString(),
                                      ),
                                    ),
                                  );
                                }).toList(),
                                selectedItemBuilder: (BuildContext context) =>
                                    idlist.map((e) {
                                  return Center(
                                    child: Text(
                                      e.toString(),
                                      style: const TextStyle(
                                        color: Colors.black,
                                      ),
                                    ),
                                  );
                                }).toList(),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
                  child: Text(
                    "Material Description",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      // fontSize: 20,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
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
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
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
                                vertical: 10,
                              ),
                              margin: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 10),
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
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Available Qty.",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                // fontSize: 20,
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              padding: const EdgeInsets.symmetric(
                                vertical: 10,
                              ),
                              margin: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4.0),
                                  color: AppColor.inputbgclr),
                              child: Text(
                                availablevlu.toString(),
                                textAlign: TextAlign.center,
                                // style: TextStyle(fontSize: 20),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Expanded(
                        flex: 3,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.symmetric(vertical: 5),
                              child: Text(
                                "Required Qty.",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  // fontSize: 20,
                                ),
                              ),
                            ),
                            Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: TextField(
                                controller: addvalue,
                                textAlign: TextAlign.left,
                                keyboardType: TextInputType.number,
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                // style: const TextStyle(fontSize: 20),
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
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            const Padding(
                              padding: EdgeInsets.symmetric(vertical: 5),
                              child: Text(
                                "",
                              ),
                            ),
                            InkWell(
                                onTap: () {
                                  updateList();
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15, vertical: 5),
                                  margin: EdgeInsets.only(right: 10),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: AppColor.themeColor),
                                  child: const Icon(
                                    Icons.add,
                                    color: Colors.white,
                                    size: 38,
                                  ),
                                )),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          if (c.addBlastingRequest.isNotEmpty)
            SizedBox(
              child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.only(
                      top: 8, bottom: 8, right: 8, left: 13),
                  decoration: const BoxDecoration(
                    color: AppColor.highlightclr,
                  ),
                  child: const Center(
                      child: Text(
                    " Request Material List ",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ))),
            ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ...c.addBlastingRequest.map((e) {
                return Container(
                  color: Colors.white,
                  child: Container(
                    margin:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                    decoration: BoxDecoration(
                      color: AppColor.inputbgclr,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                              fit: FlexFit.tight,
                              flex: 2,
                              child: Container(
                                width: double.infinity,
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  getmaterialname(e.materialId).toString(),
                                  maxLines: 2,
                                ),
                              )),
                          Flexible(
                            fit: FlexFit.tight,
                            flex: 1,
                            child: Container(
                                width: double.infinity,
                                alignment: Alignment.center,
                                child: Column(
                                  children: [
                                    const Text(
                                      "unit",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      getUnitbyID(e.materialId).toString(),
                                    ),
                                  ],
                                )),
                          ),
                          Flexible(
                            fit: FlexFit.tight,
                            flex: 1,
                            child: Container(
                              width: double.infinity,
                              alignment: Alignment.center,
                              child: Column(
                                // ignore: prefer_const_literals_to_create_immutables
                                children: [
                                  const Text(
                                    "Qty",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "",
                                  ),
                                ],
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              requestDelete(e.materialId);
                            },
                            child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 15),
                                decoration: BoxDecoration(
                                  color: AppColor.themeColor,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: const Icon(
                                  Icons.delete,
                                  color: Colors.white,
                                )),
                          )
                        ]),
                  ),
                );
              }).toList(),
            ],
          ),
          if (c.addBlastingRequest.isNotEmpty)
            Padding(
                padding: const EdgeInsets.only(bottom: 150),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      onTap: () {
                        errormsgbox(context, "The request is successful");

                        c.addBlastingRequest.clear();
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
                        c.addBlastingRequest.clear();
                      },
                      // ignore: prefer_const_constructors
                      child: Card(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 10),
                        color: AppColor.highlightclr,
                        child: const Padding(
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
    ));
  }
}
