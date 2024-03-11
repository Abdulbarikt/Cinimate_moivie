import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movie_api/app/models/trending.dart';

class ApiKey {
  static const apikey = "f495adcbdf28ad96fdf954a0df47a539";

  static const apiReadAccessToken =
      "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJmNDk1YWRjYmRmMjhhZDk2ZmRmOTU0YTBkZjQ3YTUzOSIsInN1YiI6IjY1ZWFmNzljMzM5NmI5MDE2Mjg0YzJiMSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.Xr0b4hplAcFMtbZ3EVtAOBA9zpziBpaRz9S220D6U5A";
  static const imagePath =
      'https://image.tmdb.org/t/p/w500';

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
}
