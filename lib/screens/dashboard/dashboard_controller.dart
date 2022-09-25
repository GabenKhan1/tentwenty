import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController {
  // * instances

  // * set initial index 1 so the dashboard starts from watch screen.
  DashboardController() : pageController = PageController(initialPage: 1);

  // * varaibles
  //* Use this variable to navigate the pages of PageView.
  final PageController pageController;

  //* Set the initial index 1, so the initial landing page should be watch page according to bottom nav.
  final _page = 1.obs;
  //* Set the actual variable private so we could not do business logic inside UI, and use getter to get the value.
  get page => _page.value;

  // * observable varaible for storing app bar title
  final _appbarTitle = "Watch".obs;
  get appbarTitle => _appbarTitle.value;
  set appbarTitle(value) => _appbarTitle.value = value;

  // * drawer's methods end here

  //* Call this method inside PageView, whenever page changes.
  void onPageChanged(int pageIndex) {
    _page.value = pageIndex;

    // * check page index and update the app bar title accordingly.
    if (page == 0) {
      appbarTitle = "DashBoard";
    } else if (page == 1) {
      appbarTitle = "Watch";
    } else if (page == 2) {
      appbarTitle = "Media Library";
    } else if (page == 3) {
      appbarTitle = "More";
    } else {
      appbarTitle = "";
    }
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}
