// ignore_for_file: unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/controller.dart';
import '../../controller/fetchdatas.dart';
import '../../core/app_colors.dart';
import '../../controller/extensions.dart';
import '../widgets/exapadedcard.dart';

class InventoryScreen extends StatefulWidget {
  InventoryScreen({Key? key, required reload, required BuildContext context})
      : super(key: key);

  @override
  State<InventoryScreen> createState() => _InventoryScreenState();
}

class _InventoryScreenState extends State<InventoryScreen> {
  final Controller c = Get.put(Controller());
  // of the TextField.
  final addvalue = TextEditingController();

  @override
  void dispose() {
    addvalue.dispose();
    super.dispose();
  }

  void changeScreen(var data) {
    setState(() {});
  }

  String? selectedItem;
  // var unitvlu;
  // var availablevlu;
  // void Findstate() {
  //   getDropdownLite().map((e) {
  //     if (getmaterialname(e["materialId"]).toString() == selectedItem) {
  //       setState(() {
  //         unitvlu = getUnitbyID(e["materialId"]).toString();
  //         availablevlu = getQtybyID(e["materialId"]).toString();
  //       });
  //     }
  //   }).toList();
  // }

  @override
  Widget build(BuildContext context) {
    return Column(
      // physics: const NeverScrollableScrollPhysics(),
      children: [
        Container(
          color: AppColor.highlightclr,
          height: 5,
          width: double.infinity,
        ),
        if (c.roleid == 3)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
                  child: Text(
                    "Subcontractor",
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
                        borderRadius: BorderRadius.circular(10)),
                    child: DropdownButton<String>(
                      value: selectedItem,
                      focusColor: AppColor.inputbgclr,
                      onChanged: (value) {
                        setState(() {
                          selectedItem = value;
                          c.inventorySubId.value = value!;
                          // Findstate();
                        });
                      },
                      hint: Center(
                          child: Text(
                        c.inventorySubId == ""
                            ? 'All Subcontractor'
                            : getSubcontractorName(
                                int.parse(c.inventorySubId.toString())),
                        style: TextStyle(color: Colors.black),
                      )),
                      underline: Container(),
                      dropdownColor: AppColor.inputbgclr,
                      icon: const Icon(
                        Icons.keyboard_arrow_down,
                        color: Colors.black,
                      ),
                      isExpanded: true,
                      items: c.subcontractorList.map((e) {
                        return DropdownMenuItem(
                            value:
                                capitalize(e["subConId"].toString()).toString(),
                            child: Container(
                              // margin: EdgeInsets.all(value),
                              alignment: Alignment.centerLeft,

                              child: Text(
                                capitalize(e["subConName"]).toString(),
                                style: const TextStyle(
                                    // fontSize: 20,
                                    ),
                              ),
                            ));
                      }).toList(),
                      selectedItemBuilder: (BuildContext context) =>
                          c.subcontractorList.map((e) {
                        return Center(
                          child: Text(
                            capitalize(e["subConName"]).toString(),
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
              ],
            ),
          ),
        if (c.roleid == 3)
          Container(
            color: AppColor.highlightclr,
            height: 5,
            width: double.infinity,
          ),
        Expanded(
          child: FutureBuilder(
              future: fetchInventorydata(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  // ignore: avoid_print
                  print('error in loading${snapshot.error.toString()}');
                }
                if (snapshot.hasData) {
                  // print(snapshot.data.toString());
                  return Container(
                      color: AppColor.highlightclr,
                      margin: const EdgeInsets.only(bottom: 70),
                      child: Container(
                          padding: const EdgeInsets.only(
                            top: 5,
                          ),
                          decoration: const BoxDecoration(
                            color: Color.fromARGB(255, 255, 255, 255),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(15),
                                topRight: Radius.circular(15)),
                          ),
                          child: ListView.builder(
                              itemCount: snapshot.data.length,
                              itemBuilder: (context, i) {
                                if (c.roleid.toString() == "3") {
                                  if (c.inventorySubId == '') {
                                    return ExpandedTile(data: snapshot.data[i]);
                                  } else {
                                    if (snapshot.data[i]["subConId"]
                                            .toString() ==
                                        c.inventorySubId.toString()) {
                                      return ExpandedTile(
                                          data: snapshot.data[i]);
                                    } else {
                                      return Container();
                                    }
                                  }
                                } else if (snapshot.data[i]["subConId"]
                                        .toString() ==
                                    c.subconid.toString()) {
                                  return ExpandedTile(data: snapshot.data[i]);
                                } else {
                                  return Container();
                                }
                              })));
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
