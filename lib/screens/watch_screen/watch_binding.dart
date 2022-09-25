import 'package:flutter_tentwenty_app/screens/watch_screen/watch_controller.dart';
import 'package:get/instance_manager.dart';

class WatchBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => WatchController());
  }
}
