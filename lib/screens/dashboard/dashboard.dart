import 'package:flutter/material.dart';
import 'package:flutter_tentwenty_app/core/theme/values/constants.dart';
import 'package:flutter_tentwenty_app/screens/dashboard/dashboard_controller.dart';
import 'package:flutter_tentwenty_app/screens/watch_screen/watch_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get_state_manager/get_state_manager.dart';

import '../../core/theme/values/colors.dart';

class Dashboard extends GetView<DashboardController> {
  Dashboard({Key? key}) : super(key: key);

  final List<Map<String, dynamic>> _iconsAndText = [
    {
      "text": "Dashboard",
      "icon": Icons.dashboard,
    },
    {"text": "Watch", "icon": FontAwesomeIcons.play},
    {"text": "Media Library", "icon": FontAwesomeIcons.addressBook},
    {"text": "More", "icon": FontAwesomeIcons.list},
  ];

  _builtTabIcon(BuildContext context, int iconIndex) {
    return Obx(
      () => GestureDetector(
        onTap: () => controller.pageController.jumpToPage(iconIndex),
        child: controller.page != iconIndex
            ? Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  FaIcon(
                    _iconsAndText[iconIndex]["icon"],
                    color: Colors.grey,
                    size: 20,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    _iconsAndText[iconIndex]["text"],
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                    ),
                  ),
                ],
              )
            : Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  FaIcon(
                    _iconsAndText[iconIndex]["icon"],
                    color: Colors.white,
                    size: 20,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    _iconsAndText[iconIndex]["text"],
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: white,
        body: SafeArea(
          child: PageView(
            physics: const NeverScrollableScrollPhysics(),
            controller: controller.pageController,
            onPageChanged: controller.onPageChanged,
            children: const [
              Center(child: Text("DashBoard")),
              WatchScreen(),
              Center(child: Text("Media Library")),
              Center(child: Text("More")),
            ],
          ),
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                blurRadius: 20,
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(24),
              topLeft: Radius.circular(24),
            ),
            child: BottomAppBar(
              color: Colors.black,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 26),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _builtTabIcon(context, dashboard),
                    _builtTabIcon(context, watch),
                    _builtTabIcon(context, medisLibrary),
                    _builtTabIcon(context, more),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
