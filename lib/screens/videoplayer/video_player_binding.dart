import 'package:flutter_tentwenty_app/screens/videoplayer/video_player_controller.dart';
import 'package:get/instance_manager.dart';

class VideoPlayerBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => VideoPlayerScreenController());
  }
}
