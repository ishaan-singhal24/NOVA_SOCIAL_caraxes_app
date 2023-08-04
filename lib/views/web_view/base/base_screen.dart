import 'package:flutter/material.dart';
import 'package:nova_social/data/constants/constants.dart';
import 'package:nova_social/utils/utils.dart';
import 'package:nova_social/views/web_view/base/pages/pages.dart';
import 'package:nova_social/views/web_view/base/pages/space_station/space_station_page.dart';
import 'package:nova_social/views/web_view/base/widgets/widgets.dart';

class BaseScreen extends StatefulWidget {
  const BaseScreen({Key? key}) : super(key: key);

  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  int selectedPageIndex = 0;
  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance.init(context);
    return Scaffold(
      appBar: const TopAppBar(),
      extendBody: true,
      body: PageView(
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(),
        onPageChanged: (p) {
          selectedPageIndex = p;
          setState(() {});
        },
        children: [
          Container(
            color: AppColors.novaGreenAccent,
          ),
          const NetworkPage(),
          const SpaceStationPage(),
          const MessagesPage(),
          const NotificationsPage(),
        ],
      ),
      bottomNavigationBar: BottomNavBar(
        selectedPageIndex: selectedPageIndex,
        onTap: (i) {
          pageController.jumpToPage(i);
        },
      ),
    );
  }
}
