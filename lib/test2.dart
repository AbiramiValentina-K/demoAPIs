import 'package:blaster/app/controller/extensions.dart';
import 'package:blaster/app/core/app_colors.dart';
import 'package:flutter/material.dart';

import 'app/controller/controller.dart';


class mtrial extends StatelessWidget {
  mtrial({
    Key? key,
    required this.c,
    required this.list,
  }) : super(key: key);

  final Controller c;
  var list;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Flexible(
          fit: FlexFit.tight,
          flex: 2,
          child: Container(
              width: double.infinity,
              child: Text(getmaterialname(list["materialId"]).toString(),
                  style: const TextStyle(
                      // fontSize: 20,
                      ))),
        ),
        Flexible(
            fit: FlexFit.tight,
            flex: 1,
            child: Container(
              width: double.infinity,
              alignment: Alignment.center,
              child: Text(getUnitbyID(list["materialId"]).toString(),
                  style: const TextStyle(
                      // fontSize: 20,
                      )),
            )),
        Flexible(
          fit: FlexFit.tight,
          flex: 1,
          child: Container(
            width: double.infinity,
            alignment: Alignment.center,
            child: Text(list["qty"].toString(),
                style: const TextStyle(
                    // fontSize: 20,
                    )),
          ),
        ),
        if (c.roleid == 3)
          Flexible(
            fit: FlexFit.tight,
            flex: 1,
            child: Flexible(
              fit: FlexFit.loose,
              child: Container(
                width: 100,
                height: 40,
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: TextField(
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                        // fontSize: 20
                        ),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: AppColor.inputbgclr,
                      enabledBorder: UnderlineInputBorder(
                        borderSide:
                            const BorderSide(color: AppColor.inputbgclr),
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                      focusColor: Colors.black,
                      focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 255, 255, 255)),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
      ]),
    );
  }
}

class mtriarl extends StatelessWidget {
  mtriarl({
    Key? key,
    required this.c,
    required this.list,
  }) : super(key: key);

  final Controller c;
  var list;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Flexible(
          fit: FlexFit.tight,
          flex: 2,
          child: Container(
              width: double.infinity,
              child: Text(getmaterialname(list["materialId"]).toString(),
                  style: const TextStyle(
                      // fontSize: 20,
                      ))),
        ),
        Flexible(
            fit: FlexFit.tight,
            flex: 1,
            child: Container(
              width: double.infinity,
              alignment: Alignment.center,
              child: Text(getUnitbyID(list["materialId"]).toString(),
                  style: const TextStyle(
                      // fontSize: 20,
                      )),
            )),
        Flexible(
          fit: FlexFit.tight,
          flex: 1,
          child: Container(
            width: double.infinity,
            alignment: Alignment.center,
            child: Text(list["qty"].toString(),
                style: const TextStyle(
                    // fontSize: 20,
                    )),
          ),
        ),
        if (c.roleid == 3)
          Flexible(
            fit: FlexFit.tight,
            flex: 1,
            child: Flexible(
              fit: FlexFit.loose,
              child: Container(
                width: 100,
                height: 40,
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: TextField(
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                        // fontSize: 20
                        ),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: AppColor.inputbgclr,
                      enabledBorder: UnderlineInputBorder(
                        borderSide:
                            const BorderSide(color: AppColor.inputbgclr),
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                      focusColor: Colors.black,
                      focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 255, 255, 255)),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
      ]),
    );
  }
}
