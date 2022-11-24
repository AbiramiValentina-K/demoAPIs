import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../view/widgets/errormsgbox.dart';
import 'controller.dart';
import '../view/screens/homepage.dart';

Future login(String username, String password, context) async {
  final Controller c = Get.put(Controller());
  try {
    final Uri uri = Uri.parse("${c.baseurl}/user/all");
    final response = await http.get(uri);
    var datareceived = jsonDecode(response.body);
    String str = username;
    if (username == "" || password == "") {
      errormsgbox(context, "Please Enter Valid USERID and PASSWORD");
    } else {
      for (int i = 0; datareceived.length > i; i++) {
        if (datareceived[i]['loginId'] == str) {
          if (datareceived[i]['roleId'] == 1 ||
              datareceived[i]['roleId'] == 2 ||
              datareceived[i]['roleId'] == 3) {
            c.updateUser(datareceived[i]['userId'], datareceived[i]['subConId'],
                datareceived[i]['roleId'], datareceived[i]['userName']);
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => Homepage(),
              ),
            );
            break;
          } else {
            errormsgbox(context, "Invalid user for\n mobile application");
            break;
          }
        } else if (i == (datareceived.length - 1)) {
          errormsgbox(context, "Enter Correct USERNAME \n and PASSWORD");
        }
      }
    }
  } catch (e) {
    errormsgbox(context, "Check your\ninternet connection");
  }
}
