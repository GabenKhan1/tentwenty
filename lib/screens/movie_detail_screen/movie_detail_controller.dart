import 'package:flutter_tentwenty_app/data/models/movie_detail_model.dart';
import 'package:flutter_tentwenty_app/data/providers/movies_provider.dart';
import 'package:get/get.dart';

class MovieDetailController extends GetxController {
  final MovieProvider _movieProvider = MovieProvider();
  MovieDetailModel movieDetailModel = MovieDetailModel();

  final String movieId = Get.arguments;

  Future<void> movieDetails() async {
    movieDetailModel = await _movieProvider.movieId(movieId);
    update();
  }

  @override
  void onInit() async {
    movieDetails();

    super.onInit();
  }
}
