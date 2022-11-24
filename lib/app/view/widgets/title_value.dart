import 'package:flutter/material.dart';

import '../../controller/extensions.dart';

class CTitleValue extends StatelessWidget {
  const CTitleValue({
    Key? key,
    required this.title,
    required this.value,
  }) : super(key: key);

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          if (value != "")
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                value,
                maxLines: 2,
                // style: const TextStyle(fontSize: 20),
              ),
            ),
        ],
      ),
    );
  }
}

class RTitleValue extends StatelessWidget {
  const RTitleValue({
    Key? key,
    required this.title,
    required this.value,
  }) : super(key: key);

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "$title  : ",
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Flexible(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                value,
                maxLines: 2,
                // style: const TextStyle(fontSize: 20),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
