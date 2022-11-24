import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'app/controller/extensions.dart';
import 'app/controller/posting.dart';
import 'app/core/app_colors.dart';

msgbox(BuildContext context, {required data}) async {
  final addvalue = TextEditingController();

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        content: SizedBox(
          height: MediaQuery.of(context).size.height * 0.3,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  child: Text(
                    "Enter Qty.",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      // fontSize: 20,
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  margin:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 18),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.0),
                      color: AppColor.inputbgclr),
                  child: TextField(
                    controller: addvalue,
                    textAlign: TextAlign.left,
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      onTap: () {
                        if (addvalue.text.isNotEmpty) {
                          addQty(context, data["stockId"], data["subConId"],
                              data["materialId"], addvalue.text);
                          //BuildContext context, var stockid,var mtlid,var cqty, var uqty
                        }
                        // errormsgbox(context, "The request is successful");
                      },
                      child: const Card(
                        margin:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                        color: AppColor.themeColor,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 25, vertical: 15),
                          child: Text(
                            "Request",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      // ignore: prefer_const_constructors
                      child: Card(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 10),
                        color: AppColor.highlightclr,
                        child: const Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 25, vertical: 15),
                          child: Text(
                            "Cancel",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ]),
        ),
      );
    },
  );
}

approvedQtybox(BuildContext context, {required data}) async {
  final addvalue = TextEditingController();

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        content: SizedBox(
          height: MediaQuery.of(context).size.height * 0.3,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Flexible(
                      fit: FlexFit.loose,
                      flex: 1,
                      child: Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Flexible(
                              child: Text(
                                "Added Qty. : ",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            Text(data["updatedQty"].toString()),
                          ],
                        ),
                      ),
                    ),
                    Flexible(
                      fit: FlexFit.loose,
                      flex: 1,
                      child: Container(
                        padding: const EdgeInsets.all(8.0),
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Flexible(
                              child: const Text(
                                "total stock qty . : ",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            Text((int.parse(getQtybyID(data["materialId"])
                                        .toString()) +
                                    (addvalue.text == null
                                        ? int.parse(addvalue.text)
                                        : 0))
                                .toString()),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    const Text(
                      "Enter Approved Qty.",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        // fontSize: 20,
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      margin: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 18),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4.0),
                          color: AppColor.inputbgclr),
                      child: TextField(
                        controller: addvalue,
                        textAlign: TextAlign.left,
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly
                        ],
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
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      onTap: () {
                        if (addvalue.text.isNotEmpty) {
                          approvedQty(context, data["materialId"],
                              data["stockId"], data["subConId"], addvalue.text);
                          //var materialId,  var stockid, var subconid,  var qty,
                        }
                        // errormsgbox(context, "The request is successful");
                      },
                      // ignore: prefer_const_constructors
                      child: Card(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 10),
                        color: AppColor.themeColor,
                        child: const Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 25, vertical: 15),
                          child: Text(
                            "Approved",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      // ignore: prefer_const_constructors
                      child: Card(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 10),
                        color: AppColor.highlightclr,
                        child: const Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 25, vertical: 15),
                          child: Text(
                            "Cancel",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ]),
        ),
      );
    },
  );
}
