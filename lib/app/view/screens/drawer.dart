import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/controller.dart';
import '../../controller/extensions.dart';
import '../../core/app_colors.dart';
import '../../core/app_data.dart';

class AppDrawer extends StatelessWidget {
  AppDrawer({Key? key}) : super(key: key);
  final Controller c = Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    double scrwidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Column(
        children: [
          const SizedBox(
            height: 60,
          ),
          Flexible(
            child: AnimatedContainer(
              width: scrwidth >= 600 ? 400 : scrwidth * 0.6,
              duration: const Duration(milliseconds: 400),
              decoration: const BoxDecoration(
                color: AppColor.themeColor,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(50.0),
                ),
                // border: Border.all(width: 3, color: AppColor.highlightclr)
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.only(
                      bottom: 10,
                    ),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(10.0),
                          child: CircleAvatar(
                            minRadius: 50,
                            backgroundImage: NetworkImage(
                              AppDatas.icon,
                            ),
                          ),
                        ),
                        Column(
                          children: [
                            DR_Titlevalie(title: "Job Code : ", value: "0000"),
                            DR_Titlevalie(
                                title: "Login ID : ",
                                value: c.userid.toString()),
                            DR_Titlevalie(
                                title: "UserName : ",
                                value: c.username.toString()),
                            DR_Titlevalie(
                                title: "Role : ",
                                value: getRoleName(c.subconid).toString()),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Container(
                    padding: const EdgeInsets.all(8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Designed by : ",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Flexible(
                          child: Padding(
                            padding: EdgeInsets.only(right: 20),
                            child: Text(
                              "Graspear Solution",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DR_Titlevalie extends StatelessWidget {
  const DR_Titlevalie({
    Key? key,
    required this.title,
    required this.value,
  }) : super(key: key);

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Row(
        children: [
          Text(
            title,
            style: const TextStyle(
                color: AppColor.themeColor, fontWeight: FontWeight.bold),
          ),
          Text(
            value,
            style: const TextStyle(
              color: AppColor.themeColor,
            ),
          ),
        ],
      ),
    );
  }
}
