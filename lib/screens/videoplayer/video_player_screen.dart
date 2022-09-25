import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tentwenty_app/screens/videoplayer/video_player_controller.dart';
import 'package:get/get.dart';

class VideoPlayerScreen extends GetView<VideoPlayerScreenController> {
  const VideoPlayerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("video Player"),
        backgroundColor: Colors.black,
        leading: IconButton(
            onPressed: () {
              Get.delete<VideoPlayerScreenController>();
              Get.back();
            },
            icon: const Icon(Icons.arrow_back_ios)),
        centerTitle: true,
      ),
      body: GetBuilder<VideoPlayerScreenController>(
        init: VideoPlayerScreenController(),
        builder: (controller) => SizedBox(
          height: Get.height,
          width: Get.width,
          child: controller.chewieController != null &&
                  controller.chewieController!.videoPlayerController.value
                      .isInitialized
              ? Chewie(
                  controller: controller.chewieController!,
                )
              : Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      CircularProgressIndicator(
                        color: Color(0xFF4A8DBC),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text('Loading...')
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
