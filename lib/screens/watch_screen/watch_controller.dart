import 'package:flutter_tentwenty_app/data/models/movie_model.dart';
import 'package:flutter_tentwenty_app/data/providers/movies_provider.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class WatchController extends GetxController {
  final MovieProvider _movieProvider = MovieProvider();
  MovieModel movieModel = MovieModel();

  watchs() async {
    movieModel = await _movieProvider.moviewProvider();
    update();
    //print(movieModel.results?[1].title);
  }

  @override
  void onInit() {
    watchs();
    super.onInit();
  }
}
