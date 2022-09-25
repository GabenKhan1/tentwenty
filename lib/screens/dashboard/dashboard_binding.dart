import 'package:flutter_tentwenty_app/screens/dashboard/dashboard_controller.dart';
import 'package:flutter_tentwenty_app/screens/watch_screen/watch_controller.dart';
import 'package:get/instance_manager.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DashboardController());

    Get.put(WatchController());
  }
}
