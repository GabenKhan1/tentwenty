import 'package:flutter_tentwenty_app/screens/search_screen/search_controller.dart';
import 'package:get/instance_manager.dart';

class SearchBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SearchController());
  }
}
