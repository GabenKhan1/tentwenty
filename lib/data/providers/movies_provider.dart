// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_tentwenty_app/data/models/movie_detail_model.dart';
import 'package:flutter_tentwenty_app/data/models/movie_model.dart';
import 'package:flutter_tentwenty_app/data/models/search_model.dart';
import 'package:flutter_tentwenty_app/data/models/trailer_model.dart';

class MovieProvider {
  final _dio = Dio();
  final baseUrl = "http://api.themoviedb.org/3/movie/";
  final String url = "upcoming?api_key=4fd931bcfa095b1841c1d66bf46f38a6";

  String movieUrl = "?api_key=4fd931bcfa095b1841c1d66bf46f38a6";
  String trailer = "videos?api_key=4fd931bcfa095b1841c1d66bf46f38a6";

  String search =
      "https://api.themoviedb.org/3/search/movie?api_key=4fd931bcfa095b1841c1d66bf46f38a6";

  Future<dynamic> moviewProvider() async {
    try {
      final _response = await _dio.get(baseUrl + url);

      if (_response.statusCode == 200) {
        return MovieModel.fromJson(_response.data);
      } else {
        return _response.data["msg"];
      }
    } on DioError catch (e) {
      log("error occur: $e");
      rethrow;
    }
  }

  Future<dynamic> movieId(String id) async {
    try {
      final _response = await _dio.get(
        baseUrl + id + movieUrl,
      );

      if (_response.statusCode == 200) {
        return MovieDetailModel.fromJson(_response.data);
      } else {
        return _response.data["msg"];
      }
    } on DioError catch (e) {
      log("error occur: $e");
      rethrow;
    }
  }

  Future<dynamic> videoPlay(String id) async {
    try {
      final _response = await _dio.get(
        baseUrl + id + trailer,
      );

      if (_response.statusCode == 200) {
        return TrailerModel.fromJson(_response.data);
      } else {
        return _response.data["msg"];
      }
    } on DioError catch (e) {
      log("error occur: $e");
      rethrow;
    }
  }

  Future<dynamic> searchCall(String id) async {
    try {
      final _response = await _dio.get(search, queryParameters: {"query": id});

      if (_response.statusCode == 200) {
        return SearchModel.fromJson(_response.data);
      } else {
        return _response.data["msg"];
      }
    } on DioError catch (e) {
      log("error occur: $e");
      rethrow;
    }
  }
}
