// ignore_for_file: depend_on_referenced_packages

import 'dart:core';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tentwenty_app/data/models/trailer_model.dart';
import 'package:flutter_tentwenty_app/data/providers/movies_provider.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerScreenController extends GetxController {
  final MovieProvider _movieProvider = MovieProvider();

  String trId = Get.arguments;
  TrailerModel trailerModel = TrailerModel();

  late VideoPlayerController videoPlayerController;
  ChewieController? chewieController;
  final _videoTitle = "".obs;
  String get videoTitle => _videoTitle.value;
  set videoTitle(value) => _videoTitle.value = value;
  @override
  void onInit() async {
    trailerModel = await _movieProvider.videoPlay(trId);

    super.onInit();

    debugPrint(trailerModel.results?[0].key);
    debugPrint(
        "Video URL: https://www.youtube.com/watch?v=${trailerModel.results?[0].key ?? ""}");
    initializePlayer(
      videoUrl: "https://www.youtube.com/watch?v=$trailerModel.results?[0].key",
    );
  }

  @override
  void onClose() {
    videoPlayerController.dispose();
    chewieController!.dispose();
    super.onClose();
  }

  Future<void> initializePlayer({required String videoUrl}) async {
    try {
      videoPlayerController = VideoPlayerController.network(videoUrl);
      await Future.wait([videoPlayerController.initialize()]);
      chewieController = ChewieController(
        showControls: true,
        videoPlayerController: videoPlayerController,
        autoPlay: true,
        looping: false,
        materialProgressColors: ChewieProgressColors(
          playedColor: const Color(0xFF4A8DBC),
          handleColor: const Color(0xFF4A8DBC),
          backgroundColor: Colors.black,
          bufferedColor: Colors.white,
        ),
        placeholder: Container(
          color: Colors.black,
        ),
        autoInitialize: true,
      );
      update();
    } catch (e) {
      debugPrint("error:$e");
    }
  }
}
