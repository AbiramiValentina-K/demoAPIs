
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/controller.dart';
import '../../core/app_colors.dart';

class InventoryTitleCard extends StatelessWidget {
   InventoryTitleCard({
    Key? key,
  }) : super(key: key);

  final Controller c = Get.put(Controller());
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 13, bottom: 13, right: 13, left: 13),
      decoration:  const BoxDecoration(
        color: AppColor.highlightclr,
      ),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Flexible(
            fit: FlexFit.tight,
            flex: 2,
            child: Container(
              width: double.infinity,
              alignment: Alignment.centerLeft,
              child: const Text(
                "Material Description",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  // fontSize: 20,
                ),
              ),
            )),
        Flexible(
            fit: FlexFit.tight,
            flex: 1,
            child: Container(
              width: double.infinity,
              alignment: Alignment.center,
              child: const Text(
                "Unit",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  // fontSize: 20,
                ),
              ),
            )),
        Flexible(
            fit: FlexFit.tight,
            flex: 1,
            child: Container(
              width: double.infinity,
              alignment: Alignment.center,
              child: const Text(
                "Current Stock Qty",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  // fontSize: 20,
                ),
              ),
            )),
               if (c.roleid == 3)
          Flexible(
            fit: FlexFit.tight,
            flex: 1,
            child: Flexible(
              fit: FlexFit.loose,
              child: Container(
                width: 100,
                height: 40,
              
              ),
            ),
          ),
      
      ]),
    );
  }
}
