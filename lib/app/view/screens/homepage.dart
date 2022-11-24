import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/controller.dart';
import '../../core/app_colors.dart';
import '../widgets/bottombar/rolling_bottom_bar.dart';
import '../widgets/bottombar/rolling_bottom_bar_item.dart';
import '../widgets/logoutbttn.dart';
import 'blastrequest.dart';
import 'blastrequestslist.dart';
import 'drawer.dart';
import 'inventoryscreen.dart';
import 'stockapproval.dart';
import 'stocklist.dart';
import 'stockrequest.dart';

// ignore: must_be_immutable
class Homepage extends StatefulWidget {
  Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  /// Controller to handle PageView and also handles initial page
  var _pageController = PageController(initialPage: 0);
  final Controller c = Get.put(Controller());

  int maxCount = 3;

  /// widget list

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  pageReload(var index) {
    setState(() {
      scrindx = index;
      _pageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeIn,
      );
    });
  }

  int scrindx = 0;

  @override
  Widget build(BuildContext context) {
    List scrns = [
      const Text(
        "Inventory",
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
      if (c.roleid == 2)
        const Text(
          "Blast Request",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 18,
          ),
        ),
      const Text(
        "Blast Request List",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white,
          fontSize: 18,
        ),
      ),
      if (c.roleid == 2)
        const Text(
          "Stock Request",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 18,
          ),
        ),
      const Text(
        "Stock Request List",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white,
          fontSize: 18,
        ),
      ),
      if (c.roleid == 1)
        const Text(
          "Stock Approval",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 18,
          ),
        ),
    ];
    final List<Widget> pages = [
      InventoryScreen(
        reload: pageReload,
        context: context,
      ),
      if (c.roleid == 2) BlastRuest(),
      BlastRequestScreen(
        reload: pageReload,
        context: context,
      ),
      if (c.roleid == 2) StockRequest(),
      StockListPage(
        reload: pageReload,
        context: context,
      ),
      if (c.roleid == 1)
        StockApproval(
          reload: pageReload,
          context: context,
        ),
    ];

    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        title: scrns[scrindx],
        toolbarHeight: 60,
        backgroundColor: AppColor.themeColor,
        actions: const [Logout()],
        elevation: 0,
      ),
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: List.generate(pages.length, (index) => pages[index]),
      ),
      extendBody: true,
      bottomNavigationBar: RollingBottomBar(
        controller: _pageController,
        color: AppColor.themeColor,
        itemColor: Colors.white,
        items: [
          RollingBottomBarItem(
            Icons.inventory,
          ),
          if (c.roleid == 2)
            RollingBottomBarItem(
              Icons.note_alt,
            ),
          RollingBottomBarItem(
            Icons.note,
          ),
          if (c.roleid == 2)
            RollingBottomBarItem(
              Icons.bookmark_add,
            ),
          RollingBottomBarItem(
            Icons.bookmark,
          ),
          if (c.roleid == 1)
            RollingBottomBarItem(
              Icons.bookmark_add,
            ),
        ],
        activeItemColor: Colors.white,
        enableIconRotation: true,
        onTap: (index) {
          setState(() {
            scrindx = index;
          });

          /// control your animation using page controller
          _pageController.animateToPage(
            index,
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeIn,
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 10,
        backgroundColor: AppColor.themeColor,
        onPressed: () {
          setState(() {
            scrindx = 0;
            _pageController.animateToPage(
              0,
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeIn,
            );
          });
        },
        child: const Center(child: Icon(Icons.notifications_none_outlined)),
      ),
    );
  }
}
