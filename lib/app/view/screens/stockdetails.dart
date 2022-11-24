// ignore_for_file: unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../test2.dart';
import '../../controller/controller.dart';
import '../../core/app_colors.dart';
import '../../controller/extensions.dart';
import '../widgets/errormsgbox.dart';
import '../widgets/inventory_title_card.dart';
import '../widgets/logoutbttn.dart';
import '../widgets/title_value.dart';

class StockDetails extends StatefulWidget {
  StockDetails({super.key, required this.data, required context});
  var data;

  @override
  State<StockDetails> createState() => _StockDetailsState();
}

class _StockDetailsState extends State<StockDetails> {
  final Controller c = Get.put(Controller());
  var Item;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Stock List",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            // fontSize: 20,
          ),
        ),
        toolbarHeight: 60,
        backgroundColor: AppColor.themeColor,
        actions: const [Logout()],
      ),
      body: Container(
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CTitleValue(
                    title: "OrderId", value: widget.data["orderId"].toString()),
                CTitleValue(
                    title: "Date",
                    value: dategetDMY(widget.data["date"].toString())),
                CTitleValue(
                    title: "Material Description",
                    value: widget.data["material Name"].toString()),
                // CTitleValue(title: "Unit", value: data["unit"].toString()),
              ],
            ),
            RTitleValue(
                title: "Blaster", value: widget.data["Blaster"].toString()),
            const CTitleValue(title: "Sub Contractor", value: ""),
            RTitleValue(
                title: "To",
                value:
                    getSubcontractorName(widget.data["subConId"]).toString()),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  const Text(
                    "From  : ",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      // fontSize: 20,
                    ),
                  ),
                  c.roleid == 3
                      ? Container(
                          width: 300,
                          height: 40,
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          padding: const EdgeInsets.only(right: 40, left: 10),
                          decoration: BoxDecoration(
                              color: AppColor.inputbgclr,
                              borderRadius: BorderRadius.circular(4)),
                          // child: DropdownButton<String>(
                          //   value: Item,
                          //   focusColor: AppColor.inputbgclr,
                          //   onChanged: (value) {
                          //     setState(() {
                          //       Item = value;
                          //       // Findstate();
                          //     });
                          //   },
                          //   hint: Center(
                          //       child: Text(
                          //     'select Subcontractor',
                          //     style: TextStyle(color: Colors.black),
                          //   )),
                          //   underline: Container(),
                          //   dropdownColor: AppColor.inputbgclr,
                          //   icon: const Icon(
                          //     Icons.keyboard_arrow_down,
                          //     color: Colors.black,
                          //   ),
                          //   isExpanded: true,
                          //   items: c.subcontractorList.map((e) {
                          //     return DropdownMenuItem(
                          //         value: e["subConName"].toString(),
                          //         child: Container(
                          //           // margin: EdgeInsets.all(value),
                          //           alignment: Alignment.centerLeft,
                          //           child: Text(
                          //             e["subConName"].toString(),
                          //             style: const TextStyle(
                          //                 // fontSize: 20,
                          //                 ),
                          //           ),
                          //         ));
                          //   }).toList(),
                          //   selectedItemBuilder: (BuildContext context) =>
                          //       c.subcontractorList.map((e) {
                          //     return Center(
                          //       child: Text(
                          //         e["subConName"].toString(),
                          //         style: const TextStyle(
                          //           // fontSize: 20,
                          //           color: Colors.black,
                          //         ),
                          //       ),
                          //     );
                          //   }).toList(),
                          // ),
                        )
                      : Container(
                          margin: const EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                              getSubcontractorName(widget.data["fromSubConId"])
                                  .toString()),
                        ),
                ],
              ),
            ),
            RTitleValue(
                title: "Status ",
                value: widget.data["status"] != null
                    ? widget.data["status"].toString()
                    : "---"),
            RTitleValue(
                title: "Remarks",
                value: widget.data["remarks"] != null
                    ? widget.data["remarks"].toString()
                    : "---"),
            Flexible(child: InventoryTitleCard()),
            Expanded(
              child: Container(
                color: AppColor.highlightclr,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15)),
                  ),
                ),
              ),
            ),
            ...c.stockRequestdetailslist.map((e) {
              if (e["stockTransferRequestHeaderId"] ==
                  widget.data["stockTransferRequestHeaderId"]) {

                return mtrial(c: c, list: e);
              } else {
                return Container();
              }
            }).toList(),
            if (c.roleid == 3)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    onTap: () {
                      errormsgbox(context, "Successful approval");
                    },
                    // ignore: prefer_const_constructors
                    child: Card(
                      margin: const EdgeInsets.symmetric(horizontal: 15),
                      color: AppColor.themeColor,
                      child: const Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                        child: Text(
                          "Approve",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () async {
                      Navigator.pop(context);
                    },
                    child: const Card(
                      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                      color: AppColor.highlightclr,
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                        child: Text(
                          "Cancel",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ),
                ],
              )
          ],
        ),
      ),
    );
  }
}
