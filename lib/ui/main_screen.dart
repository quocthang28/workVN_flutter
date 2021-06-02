import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workvn/controller/app_controller.dart';
import 'package:workvn/controller/refresh_controller.dart';
import 'package:workvn/res/app_color.dart';
import 'package:workvn/ui/account/account.dart';
import 'package:workvn/ui/common_widgets/custom_bottom_appbar.dart';
import 'package:workvn/ui/favorites/favorites.dart';
import 'package:workvn/ui/near_me/near_me.dart';

import 'home/home.dart';

class TabData {
  CustomBottomAppBarItem tabButton;
  Widget tabBody;

  TabData(this.tabBody, this.tabButton);
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>
    with SingleTickerProviderStateMixin {
  final AppController _appController = Get.find();
  final _pageController = PageController();
  int _currentIndex = 0;
  List<TabData> _tabList = [];

  void _initTabList() {
    TabData homeTab = TabData(
        HomeScreen(),
        CustomBottomAppBarItem(
          key: appState.keyMenuHome,
          icon: Icons.home_outlined,
          title: 'Trang chủ',
        ));

    TabData favoritesTab = TabData(
        FavoritesScreen(),
        CustomBottomAppBarItem(
          key: appState.keyMenuFavorites,
          icon: Icons.favorite_border_outlined,
          title: 'Yêu thích',
        ));

    TabData nearMeTab = TabData(
        NearMeScreen(),
        CustomBottomAppBarItem(
          key: appState.keyMenuNearMe,
          icon: Icons.location_on_outlined,
          title: 'Gần đây',
        ));

    TabData accountTab = TabData(
        AccountScreen(),
        CustomBottomAppBarItem(
          key: appState.keyMenuAccount,
          icon: Icons.account_circle_outlined,
          title: 'Tài khoản',
        ));

    _tabList = [homeTab, favoritesTab, nearMeTab, accountTab];
  }

  void _onTap(int? index) {
    _pageController.jumpToPage(index ?? 0);
  }

  void _onPageChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  void _listenToTabChange() {
    _appController.mainTabStream.stream.listen((index) {
      _onTap(index);
    });
  }

  @override
  void initState() {
    _initTabList();
    _listenToTabChange();
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: refreshController.refreshStream,
        builder: (context, snapshot) {
          return Scaffold(
            body: PageView(
              controller: _pageController,
              onPageChanged: _onPageChanged,
              children: _tabList.map((e) => e.tabBody).toList(),
              physics: NeverScrollableScrollPhysics(), // No sliding
            ),
            bottomNavigationBar: CustomBottomAppBar(
              color: Colors.grey,
              currentIndex: _currentIndex,
              selectedColor: AppColor.lightBlue,
              onTabSelected: _onTap,
              items: _tabList.map((e) => e.tabButton).toList(),
            ),
          );
        });
  }
}
