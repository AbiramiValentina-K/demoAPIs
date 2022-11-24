import 'package:blaster/app/controller/fetchdatas.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../test2.dart';
import '../../controller/controller.dart';
import '../../core/app_colors.dart';
import '../../controller/extensions.dart';
import '../widgets/errormsgbox.dart';
import '../widgets/inventory_title_card.dart';
import '../widgets/logoutbttn.dart';
import '../widgets/title_value.dart';

// ignore: must_be_immutable
class BlasterDetailsScreen extends StatefulWidget {
  BlasterDetailsScreen({super.key, required this.data});

  var data;

  @override
  State<BlasterDetailsScreen> createState() => _BlasterDetailsScreenState();
}

class _BlasterDetailsScreenState extends State<BlasterDetailsScreen> {
  final Controller c = Get.put(Controller());
  var electedexcavation;
  var selectedsupportclase;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "BLASTE REQUEST LIST",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            // fontSize: 20,
          ),
        ),
        toolbarHeight: 60,
        backgroundColor: AppColor.themeColor,
        actions: const [Logout()],
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CTitleValue(
                      title: "OrderID",
                      value: capitalize(widget.data["orderId"].toString()),
                    ),
                    CTitleValue(
                        title: "Blaster",
                        value: widget.data["Blaster"].toString()),
                    CTitleValue(
                      title: "Date",
                      value: dategetDMY(widget.data["date"].toString()),
                    ),
                  ],
                ),
              ),
              if (c.roleid != 3)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CTitleValue(
                        title: "Shift", value: widget.data['shift'].toString()),
                    CTitleValue(
                        title: "Tunnel Face ID",
                        value: widget.data["tunnelFaceId"].toString()),
                    const CTitleValue(title: " ", value: " "),
                  ],
                ),
              if (c.roleid == 3)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Flexible(
                        flex: 2,
                        child: Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                          child: Column(
                            children: [
                              const Text(
                                "Chainage(From)",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  // fontSize: 20,
                                ),
                              ),
                              SizedBox(
                                child: Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: TextField(
                                    textAlign: TextAlign.left,
                                    // style: const TextStyle(fontSize: 20),
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: AppColor.inputbgclr,
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: AppColor.inputbgclr),
                                        borderRadius:
                                            BorderRadius.circular(4.0),
                                      ),
                                      focusColor: Colors.black,
                                      focusedBorder: const UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Color.fromARGB(
                                                255, 255, 255, 255)),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Flexible(
                        flex: 2,
                        child: Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: 25, vertical: 5),
                          child: Column(
                            children: [
                              const Text(
                                "Chainage(To)",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  // fontSize: 20,
                                ),
                              ),
                              SizedBox(
                                child: Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: TextField(
                                    textAlign: TextAlign.left,
                                    // style: const TextStyle(fontSize: 20),
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: AppColor.inputbgclr,
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: AppColor.inputbgclr),
                                        borderRadius:
                                            BorderRadius.circular(4.0),
                                      ),
                                      focusColor: Colors.black,
                                      focusedBorder: const UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Color.fromARGB(
                                                255, 255, 255, 255)),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              if (c.roleid == 3)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Flexible(
                        flex: 2,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 25, vertical: 5),
                              child: Text(
                                "Electedexcavation",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4.0),
                                  color: AppColor.inputbgclr),
                              child: DropdownButton<String>(
                                value: electedexcavation,
                                focusColor: AppColor.inputbgclr,
                                onChanged: (value) {
                                  setState(() {
                                    electedexcavation = value;
                                  });
                                },
                                hint: const Center(
                                    child: Text(
                                  'Select',
                                  style: TextStyle(color: Colors.black),
                                )),
                                underline: Container(),
                                dropdownColor: AppColor.inputbgclr,
                                icon: const Icon(
                                  Icons.keyboard_arrow_down,
                                  color: Colors.black,
                                ),
                                isExpanded: true,
                                items: c.excavation.map((e) {
                                  return DropdownMenuItem(
                                    value: e.toString(),
                                    child: Container(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        e.toString(),
                                      ),
                                    ),
                                  );
                                }).toList(),
                                selectedItemBuilder: (BuildContext context) =>
                                    c.excavation.map((e) {
                                  return Center(
                                    child: Text(
                                      e.toString(),
                                      style: const TextStyle(
                                        color: Colors.black,
                                      ),
                                    ),
                                  );
                                }).toList(),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Flexible(
                        flex: 2,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 25, vertical: 5),
                              child: Text(
                                "Support class",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4.0),
                                  color: AppColor.inputbgclr),
                              child: DropdownButton<String>(
                                value: selectedsupportclase,
                                focusColor: AppColor.inputbgclr,
                                onChanged: (value) {
                                  setState(() {
                                    selectedsupportclase = value;
                                  });
                                },
                                hint: const Center(
                                    child: Text(
                                  'Select',
                                  style: TextStyle(color: Colors.black),
                                )),
                                underline: Container(),
                                dropdownColor: AppColor.inputbgclr,
                                icon: const Icon(
                                  Icons.keyboard_arrow_down,
                                  color: Colors.black,
                                ),
                                isExpanded: true,
                                items: c.supportclaseList.map((e) {
                                  return DropdownMenuItem(
                                    value: e.toString(),
                                    child: Container(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        e.toString(),
                                      ),
                                    ),
                                  );
                                }).toList(),
                                selectedItemBuilder: (BuildContext context) =>
                                    c.supportclaseList.map((e) {
                                  return Center(
                                    child: Text(
                                      e.toString(),
                                      style: const TextStyle(
                                        color: Colors.black,
                                      ),
                                    ),
                                  );
                                }).toList(),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              Column(
                children: [
                  InventoryTitleCard(),
                  Container(
                    color: AppColor.highlightclr,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 8),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15)),
                      ),
                    ),
                  ),
                  ...c.blastingRequestdetailslist.map((e) {
                    if (e["blastingHeaderId"] ==
                        widget.data["blastingHeaderId"]) {
                      return mtriarl(c: c, list: e);
                    } else {
                      return Container();
                    }
                  }).toList(),
                ],
              ),
              if (c.roleid == 3)
                Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        InkWell(
                          onTap: () {
                            errormsgbox(context, "Successful approval");
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
                                "Approve",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () async {
                            Navigator.pop(context);
                          },
                          child: const Card(
                            margin: EdgeInsets.symmetric(
                                horizontal: 15, vertical: 10),
                            color: AppColor.highlightclr,
                            child: Padding(
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
                    ))
            ],
          ),
        ),
      ),
    );
  }
}
