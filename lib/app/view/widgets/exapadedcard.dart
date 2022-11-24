import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../test.dart';
import '../../controller/controller.dart';
import '../../controller/extensions.dart';
import '../../core/app_colors.dart';

// ignore: must_be_immutable
class ExpandedTile extends StatelessWidget {
  var data;
  final Controller c = Get.put(Controller());

  ExpandedTile({super.key, required this.data});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 5),
      child: ExpansionTile(
        backgroundColor: AppColor.inputbgclr,
        iconColor: const Color.fromARGB(255, 0, 0, 0),
        collapsedTextColor: AppColor.themeColor,
        title: _buildTitle(context),
        initiallyExpanded: false,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Flexible(
                  fit: FlexFit.tight,
                  flex: 1,
                  child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Added Qty. : ",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(data["updatedQty"].toString()),
                      ],
                    ),
                  ),
                ),
                Flexible(
                  fit: FlexFit.tight,
                  flex: 1,
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "NetStock. : ",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(data["approvedQty"].toString()),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTitle(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          margin: const EdgeInsets.symmetric(
            vertical: 3,
          ),
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
          decoration: BoxDecoration(
            color: data["updatedQty"] != 0
                ? AppColor.alertclr
                : AppColor.inputbgclr,
            borderRadius: BorderRadius.circular(8),
          ),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Flexible(
                fit: FlexFit.tight,
                flex: 2,
                child: Container(
                  width: double.infinity,
                  alignment: Alignment.centerLeft,
                  child: Text(
                    getmaterialname(data["materialId"]).toString(),
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
                        "Unit",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        getUnitbyID(data["materialId"]).toString(),
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
                  children: [
                    const Text(
                      "Qty.",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      getQtybyID(data["materialId"]).toString(),
                    ),
                  ],
                ),
              ),
            ),
            if (c.roleid == 1)
              InkWell(
                onTap: () {
                  msgbox(context, data: data);
                },
                child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    decoration: BoxDecoration(
                      color: AppColor.themeColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(
                      Icons.add,
                      color: Colors.white,
                      // size: 13,
                    )),
              ),
            if (c.roleid == 3)
              InkWell(
                onTap: () {
                  if (data["updatedQty"] != 0) {
                    approvedQtybox(context, data: data);
                  }
                },
                child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    decoration: BoxDecoration(
                      color: AppColor.approvalclr,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(
                      Icons.check_circle,
                      color: Colors.white,
                    )),
              )
          ]),
        )
      ],
    );
  }
}
