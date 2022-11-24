import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:get/get.dart';
import 'controller.dart';

final Controller c = Get.put(Controller());

Future fetchInventorydata() async {
  try {
    final Uri uri = Uri.parse(c.inventoryurl.toString());
    final responsed = await http.get(uri);
    var datareceived = jsonDecode(responsed.body);

    return datareceived;
  } catch (e) {
    return null;
  }
}

Future fetchStock() async {
  try {
    final Uri uri = Uri.parse(c.stackurl.toString());
    final responsed = await http.get(uri);
    var datareceived = jsonDecode(responsed.body);
    return datareceived;
  } catch (e) {
    return null;
  }
}

Future fetchBlasteRqstData(BuildContext context) async {
  try {
    final Uri uri = Uri.parse(c.blastingurl.toString());
    final responsed = await http.get(uri);
    var datareceived = jsonDecode(responsed.body);
    return datareceived;
  } catch (e) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return const AlertDialog(
          content: Text("Check your\ninternet connection"),
        );
      },
    );

    return null;
  }
}

Future fetchBlasteRqsDetailstData(BuildContext context) async {
  try {
    final Uri uri = Uri.parse("${c.baseurl}blastingRequest/all");
    final responsed = await http.get(uri);
    var datareceived = jsonDecode(responsed.body);
    return datareceived;
  } catch (e) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return const AlertDialog(
          content: Text("Check your\ninternet connection"),
        );
      },
    );

    return null;
  }
}

Future fetchStockTransferRqstDetailsData(BuildContext context) async {
  try {
    final Uri uri = Uri.parse('${c.baseurl}stockTransferRequestDetails/all');
    final responsed = await http.get(uri);
    var datareceived = jsonDecode(responsed.body);
    return datareceived;
  } catch (e) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return const AlertDialog(
          content: Text("Check your\ninternet connection"),
        );
      },
    );

    return null;
  }
}
