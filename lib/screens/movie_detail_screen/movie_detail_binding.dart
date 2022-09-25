import 'package:flutter_tentwenty_app/screens/movie_detail_screen/movie_detail_controller.dart';
import 'package:get/get.dart';

class MovieDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MovieDetailController());
  }
}
