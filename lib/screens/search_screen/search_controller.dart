import 'package:flutter_tentwenty_app/data/models/movie_model.dart';
import 'package:flutter_tentwenty_app/data/models/search_model.dart';
import 'package:flutter_tentwenty_app/data/providers/movies_provider.dart';
import 'package:get/get.dart';

class SearchController extends GetxController {
  final MovieProvider _movieProvider = MovieProvider();
  MovieModel movieModel = MovieModel();
  SearchModel searchModel = SearchModel();

  // // * methods
  @override
  void onInit() async {
    movieModel = await _movieProvider.moviewProvider();
    update();
    super.onInit();
  }

  search(String value) async {
    searchModel = await _movieProvider.searchCall(value);
    update();
  }
}
