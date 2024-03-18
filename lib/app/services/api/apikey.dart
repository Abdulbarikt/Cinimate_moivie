import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:movie_api/app/models/cast.dart';
import 'package:movie_api/app/models/trending.dart';

import '../../models/trailer.dart';
import '../../models/tvshow.dart';

class ApiKey {
  static const apikey = "f495adcbdf28ad96fdf954a0df47a539";

  static const apiReadAccessToken =
      "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJmNDk1YWRjYmRmMjhhZDk2ZmRmOTU0YTBkZjQ3YTUzOSIsInN1YiI6IjY1ZWFmNzljMzM5NmI5MDE2Mjg0YzJiMSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.Xr0b4hplAcFMtbZ3EVtAOBA9zpziBpaRz9S220D6U5A";
  static const imagePath = 'https://image.tmdb.org/t/p/w500';

  static const trendingUrl =
      "https://api.themoviedb.org/3/trending/movie/day?api_key=f495adcbdf28ad96fdf954a0df47a539";

  Future<List<Trending>> getTrendingMovies() async {
    final response = await http.get(Uri.parse(trendingUrl));

    if (response.statusCode == 200) {
      final decodeData = jsonDecode(response.body)['results'] as List;
      return decodeData.map((movie) => Trending.fromJson(movie)).toList();
    } else {
      throw Exception('Something Happend');
    }
  }

  static const malayalamUrl =
      'https://api.themoviedb.org/3/discover/movie?api_key=f495adcbdf28ad96fdf954a0df47a539&with_original_language=ml';
  Future<List<Trending>> getMalayamLanguage() async {
    final response = await http.get(Uri.parse(malayalamUrl));
    if (response.statusCode == 200) {
      final decodeData = jsonDecode(response.body)['results'] as List;
      return decodeData.map((movie) => Trending.fromJson(movie)).toList();
    } else {
      throw Exception('Something Happend');
    }
  }

  Future<List<Trending>> getSimilarMovies(int movieId) async {
    final response = await http.get(Uri.parse(
        "https://api.themoviedb.org/3/movie/$movieId/similar?api_key=$apikey"));
    if (response.statusCode == 200) {
      final decodeData = json.decode(response.body)['results'] as List;
      return decodeData.map((movie) => Trending.fromJson(movie)).toList();
    } else {
      throw Exception("Failed to load cast");
    }
  }

  static const topRatedUrl =
      "https://api.themoviedb.org/3/movie/top_rated?api_key=f495adcbdf28ad96fdf954a0df47a539";

  Future<List<Trending>> getTopRated() async {
    final response = await http.get(Uri.parse(topRatedUrl));

    if (response.statusCode == 200) {
      final decodeData = jsonDecode(response.body)['results'] as List;
      return decodeData.map((movie) => Trending.fromJson(movie)).toList();
    } else {
      throw Exception('Something Happend');
    }
  }

  static const upcomingUrl =
      "https://api.themoviedb.org/3/movie/upcoming?api_key=f495adcbdf28ad96fdf954a0df47a539";

  Future<List<Trending>> getUpcoming() async {
    final response = await http.get(Uri.parse(upcomingUrl));

    if (response.statusCode == 200) {
      final decodeData = jsonDecode(response.body)['results'] as List;
      return decodeData.map((movie) => Trending.fromJson(movie)).toList();
    } else {
      throw Exception('Something Happend');
    }
  }

  final String baseUrl = 'https://api.themoviedb.org/3';
  var key = '?api_key=f495adcbdf28ad96fdf954a0df47a539';
  late String endPoint;
  Future<List<TvShow>> getPopularTvShows() async {
    endPoint = 'tv/popular';
    final url = '$baseUrl$endPoint$key';

    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final decodeData = jsonDecode(response.body)['results'] as List;
      return decodeData.map((movie) => TvShow.fromJson(movie)).toList();
    } else {
      throw Exception('Something Happend');
    }
  }

  Future<List<Cast>> getCast(int movieId) async {
    final response = await http.get(Uri.parse(
        "https://api.themoviedb.org/3/movie/$movieId/credits?api_key=$apikey"));
    if (response.statusCode == 200) {
      final decodeData = json.decode(response.body)['cast'] as List;
      return decodeData.map((movie) => Cast.fromJson(movie)).toList();
    } else {
      throw Exception("Failed to load cast");
    }
  }

  Future<TrailerModel> trailer(int id) async {
    var movieTrailerUrl =
        "https://api.themoviedb.org/3/movie/$id/videos?api_key=${ApiKey.apikey}";

    var movieTrailerResponse = await http.get(Uri.parse(movieTrailerUrl));
    if (movieTrailerResponse.statusCode == 200) {
      var movieTrailerJson = jsonDecode(movieTrailerResponse.body);
      return TrailerModel.fromJson(movieTrailerJson);
    } else {
      throw Exception('Failed to load movie trailer');
    }
  }

  List<Trending> searchResult = [];
  static const search =
      "https://api.themoviedb.org/3/search/movie?api_key=855fc7bfdd6ecaed1362423aa8541807&query=";
  Future<List<Trending>> searchMovie(String movieName) async {
    final response = await http.get(Uri.parse(search + movieName));
    if (response.statusCode == 200) {
      final decodeData = json.decode(response.body)['results'] as List;
      searchResult =
          decodeData.map((movie) => Trending.fromJson(movie)).toList();

      return searchResult;
    } else {
      throw Exception("Failed to load cast");
    }
  }
}
