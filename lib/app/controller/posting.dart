import 'package:blaster/app/view/widgets/errormsgbox.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'controller.dart';
import 'extensions.dart';

final Controller c = Get.put(Controller());

Future addQty(BuildContext context, var stockid, var subconid, var mtlid,
    var uqty) async {
  final response = await http.put(
    Uri.parse('${c.baseurl}stock/$stockid/'),
    headers: <String, String>{
      'Content-Type': 'application/json',
    },
    body: jsonEncode(<String, dynamic>{
      "stockId": stockid,
      "subConId": subconid,
      "materialId": mtlid,
      "qty": 0,
      "nonConsumableQty": 0,
      "consumeType": null,
      "updatedQty": uqty,
      "approvedQty": 0,
      "status": null,
      "remarks": null,
      "createdDate": null,
      "modifiedBy": null,
      "modifiedDate": null
    }),
  );

  if (response.statusCode == 200) {
    var result = jsonDecode(response.body);
    Navigator.pop(context);
    return result;
  } else {
    errormsgbox(context, "Request Failed\nerror code : ${response.statusCode}");
  }
}

Future approvedQty(
  BuildContext context,
  var materialId,
  var stockid, var subconid,
  var qty,
) async {
  var qtytype = getQtytypebymtlID(materialId);
  final response = await http.put(
    Uri.parse('${c.baseurl}stock/$stockid/'),
    headers: <String, String>{
      'Content-Type': 'application/json',
    },
    body: jsonEncode(<String, dynamic>{
     
      qtytype.toString(): int.parse(qty),
       "stockId": stockid,
      "subConId": subconid,
      "materialId": materialId,      
      qtytype.toString(): int.parse(qty),
      "consumeType": null,
      "updatedQty": 0,
      "approvedQty": 0,
      "status": null,
      "remarks": null,
      "createdDate": null,
      "modifiedBy": null,
      "modifiedDate": null
    }),
  );
  if (response.statusCode == 200) {
    var result = jsonDecode(response.body);
    Navigator.pop(context);
    return result;
  } else {
    errormsgbox(
        context, "Approval Failed \nerror code : ${response.statusCode}");
  }
}
