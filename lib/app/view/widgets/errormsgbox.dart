import 'package:flutter/material.dart';

errormsgbox(BuildContext context, String name) {
  AlertDialog alert = AlertDialog(
    content: Text(name),
  );
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
