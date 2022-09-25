import 'package:flutter_tentwenty_app/screens/ticket_screen/ticket_controller.dart';
import 'package:get/instance_manager.dart';

class TicketBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TicketController());
  }
}
