import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../controller/controller.dart';
import '../../controller/fetchdatas.dart';
import '../../core/app_colors.dart';
import '../widgets/stocklistcard.dart';

class StockListPage extends StatefulWidget {
  StockListPage(
      {super.key, required BuildContext context, required this.reload});
  var reload;

  @override
  State<StockListPage> createState() => _StockListPageState();
}

class _StockListPageState extends State<StockListPage> {
  final Controller c = Get.put(Controller());

  TextEditingController dateInput1 = TextEditingController();
  TextEditingController dateInput2 = TextEditingController();
  List stockdetail = [];

  var strfromeDate;
  var strtoDate;

  var tmpstrfromeDate;
  var tmpstrtoDate;
  var dateInput;

  @override
  void initState() {
    super.initState();
  }

  void search() {
    if (strfromeDate != null && strtoDate != null) {
      if (strfromeDate != tmpstrfromeDate && strtoDate != tmpstrtoDate) {
        c.sRsetDate(strfromeDate, strtoDate);
      }
      tmpstrfromeDate = strfromeDate;
      tmpstrtoDate = strtoDate;
    }
    if (c.roleid == 2) {
      widget.reload(4);
    } else {
      widget.reload(2);
    }
  }

  stockList() {
    return Expanded(
      child: Column(
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
                                hintText: c.strfromDate.toString(),
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
                                    firstDate: DateTime(2020),
                                    lastDate: DateTime(2100));

                                if (pickedDate != null) {
                                  String formattedDate =
                                      DateFormat('yyyy-MM-dd')
                                          .format(pickedDate);
                                  setState(() {
                                    strfromeDate = formattedDate;
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
                                hintText: c.strtoDate.toString(),
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
                                    firstDate: DateTime(2020),
                                    lastDate: DateTime(2100));

                                if (pickedDate != null) {
                                  String formattedDate =
                                      DateFormat('yyyy-MM-dd')
                                          .format(pickedDate);
                                  setState(() {
                                    strtoDate = formattedDate;
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
                            "From  ${c.strfromDate.toString()} To  ${c.strtoDate.toString()}",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              // fontSize: 20,
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
                      margin:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      color: AppColor.themeColor,
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 10),
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
            padding:
                const EdgeInsets.only(top: 8, bottom: 8, right: 8, left: 13),
            decoration: const BoxDecoration(
              color: AppColor.highlightclr,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Flexible(
                  fit: FlexFit.loose,
                  flex: 1,
                  child: Text(
                    "ID",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Flexible(
                  fit: FlexFit.tight,
                  flex: 1,
                  child: Container(
                    width: double.infinity,
                    alignment: Alignment.center,
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
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      "Transfer From",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Flexible(
                  fit: FlexFit.tight,
                  flex: 1,
                  child: Container(
                    width: double.infinity,
                    alignment: Alignment.centerLeft,
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
                future: fetchStock(),
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
                          color: Color.fromARGB(255, 255, 255, 255),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15),
                              topRight: Radius.circular(15)),
                        ),
                        child: StocklistCard(
                          context,
                          list: [snapshot.data],
                        ),
                      ),
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                }),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: AppColor.highlightclr,
          height: 5,
          width: double.infinity,
        ),
        stockList()
      ],
    );
  }
}
