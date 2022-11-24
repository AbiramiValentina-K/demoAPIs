import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/controller.dart';
import '../../controller/extensions.dart';
import '../../core/app_colors.dart';
import '../screens/stockdetails.dart';

// ignore: must_be_immutable
class StocklistCard extends StatelessWidget {
  StocklistCard(
    BuildContext context, {
    super.key,
    required this.list,
  });
  final Controller c = Get.put(Controller());

  final List list;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: list[0].length,
        itemBuilder: (context, i) {
        if (list[0][i]["subConId"].toString() ==
              c.subconid.toString()) {
            return _Box(data: list[0][i]);
          } else {
            return Container();
          }
        });
  }
}

class _Box extends StatelessWidget {
  _Box({required this.data});
  // ignore: prefer_typing_uninitialized_variables
  var data;
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(
          vertical: 3,
        ),
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        decoration: BoxDecoration(
          color: AppColor.inputbgclr,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              fit: FlexFit.loose,
              flex: 1,
              child: Container(
                child: Text(
                  capitalize(data["orderId"].toString()),
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
                child: Text(
                  dategetDMY(data["date"].toString()),
                  // style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Flexible(
              fit: FlexFit.tight,
              flex: 1,
              child: Container(
                width: double.infinity,
                alignment: Alignment.centerLeft,
                child: Text(
                  getSubcontractorName(data["fromSubConId"]).toString(),
                  maxLines: 1,
                ),
              ),
            ),
            Flexible(
              fit: FlexFit.tight,
              flex: 1,
              child: Container(
                width: double.infinity,
                alignment: Alignment.centerLeft,
                child: Text(
                  capitalize(data["status"].toString()),
                  maxLines: 1,
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => StockDetails(
                      data: data, context: context,
                    ),
                  ),
                );
              },
              child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 15),
                  decoration: BoxDecoration(
                    color: AppColor.themeColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Icon(
                    Icons.fast_forward,
                    color: Colors.white,
                    size: 13,
                  )),
            )
          ],
        ));
    
  }
}
