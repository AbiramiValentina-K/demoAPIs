import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../controller/controller.dart';
import '../../controller/fetchdatas.dart';
import '../../core/app_colors.dart';
import '../widgets/blasterrqstlistcard.dart';

class BlastRequestScreen extends StatefulWidget {
  BlastRequestScreen(
      {super.key, required this.reload, required BuildContext context});
  var reload;

  @override
  State<BlastRequestScreen> createState() => _BlastRequestScreenState();
}

class _BlastRequestScreenState extends State<BlastRequestScreen> {
  final Controller c = Get.put(Controller());

  TextEditingController dateInput1 = TextEditingController();
  TextEditingController dateInput2 = TextEditingController();
  List stockdetail = [];

  var fromeDate;
  var toDate;

  var tmpfromeDate;
  var tmptoDate;
  @override
  void initState() {
    super.initState();
  }

  void search() {
    if (fromeDate != null && toDate != null) {
      if (fromeDate != tmpfromeDate && toDate != tmptoDate) {
        c.bRsetDate(fromeDate, toDate);
      }
      tmpfromeDate = fromeDate;
      tmptoDate = toDate;
    }
    if (c.roleid == 2) {
      widget.reload(2);
    } else {
      widget.reload(1);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          color: AppColor.highlightclr,
          height: 5,
          width: double.infinity,
        ),
        Expanded(child: Blastlist()),
      ],
    );
  }

  // ignore: non_constant_identifier_names
  Column Blastlist() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "From",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Obx(
                        () => Container(
                          width: double.infinity,
                          padding: const EdgeInsets.only(right: 10),
                          child: TextField(
                            controller: dateInput1,
                            cursorColor: AppColor.themeColor,
                            decoration: InputDecoration(
                              hintText: c.bfromDate.toString(),
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
                                    color: Color.fromARGB(255, 255, 255, 255)),
                              ),
                            ),
                            readOnly: true,
                            onTap: () async {
                              DateTime? pickedDate = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(2020),
                                  lastDate: DateTime(2100));

                              if (pickedDate != null) {
                                String formattedDate =
                                    DateFormat('dd-MM-yyyy').format(pickedDate);
                                setState(() {
                                  fromeDate = formattedDate;
                                  dateInput1.text = formattedDate;
                                });
                              } else {}
                            },
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "To",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        // fontSize: 20,
                      ),
                    ),
                    Obx(() => Container(
                          width: double.infinity,
                          padding: const EdgeInsets.only(right: 10),
                          child: TextField(
                            controller: dateInput2,
                            cursorColor: AppColor.themeColor,
                            decoration: InputDecoration(
                              hintText: c.btoDate.toString(),
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
                                    color: Color.fromARGB(255, 255, 255, 255)),
                              ),
                            ),
                            readOnly: true,
                            onTap: () async {
                              DateTime? pickedDate = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(2020),
                                  lastDate: DateTime(2100));

                              if (pickedDate != null) {
                                String formattedDate =
                                    DateFormat('dd-MM-yyyy').format(pickedDate);
                                setState(() {
                                  toDate = formattedDate;
                                  dateInput2.text = formattedDate;
                                });
                              } else {}
                            },
                          ),
                        ))
                  ],
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Obx(
                        () => Text(
                          "From  ${c.bfromDate.toString()} To  ${c.btoDate.toString()}",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: InkWell(
                  onTap: () {
                    search();
                  },
                  child: const Card(
                    margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    color: AppColor.themeColor,
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                      child: Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.only(top: 8, bottom: 8, right: 8, left: 13),
          decoration: const BoxDecoration(
            color: AppColor.highlightclr,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Flexible(
                  fit: FlexFit.tight,
                  flex: 1,
                  child: Container(
                    width: double.infinity,
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      "ID",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  )),
              Flexible(
                fit: FlexFit.tight,
                flex: 1,
                child: Container(
                  width: double.infinity,
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    "Date",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Flexible(
                fit: FlexFit.tight,
                flex: 1,
                child: Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  child: const Text(
                    "Shift",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Flexible(
                fit: FlexFit.tight,
                flex: 1,
                child: Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  child: const Text(
                    "T.face ID",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Flexible(
                fit: FlexFit.tight,
                flex: 1,
                child: Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  child: const Text(
                    "Status",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 15),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(0, 3, 9, 87),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Icon(
                    Icons.fast_forward,
                    color: Color.fromARGB(0, 255, 255, 255),
                    size: 13,
                  )),
            ],
          ),
        ),
        Expanded(
          child: FutureBuilder(
              future: fetchBlasteRqstData(context),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  // ignore: avoid_print
                  print('error in loading${snapshot.error.toString()}');
                }
                if (snapshot.hasData) {
                  return Container(
                    color: AppColor.highlightclr,
                    margin: const EdgeInsets.only(bottom: 70),
                    child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 8),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15),
                              topRight: Radius.circular(15)),
                        ),
                        child: BlasterRqstListCard(
                          context,
                          list: [snapshot.data],
                        )),
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              }),
        ),
      ],
    );
  }
}
