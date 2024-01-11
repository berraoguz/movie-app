import 'dart:convert';
import 'package:movie_app/constants.dart';
import 'package:movie_app/modals/movie.dart';
import 'package:http/http.dart';

class Api {
  static const String _trendingUrl =
      'https://api.themoviedb.org/3/trending/movie/day?language=en-US&api_key=${Constants.apiKey}';
  static const String _topRatedUrl =
      'https://api.themoviedb.org/3/movie/top_rated?language=en-US&api_key=${Constants.apiKey}';
  static const String _upcommingUrl =
      'https://api.themoviedb.org/3/movie/upcoming?language=en-US&api_key=${Constants.apiKey}';

  Future<List<Movie>> getTrendingMovies() async {
    final response = await get(Uri.parse(_trendingUrl));
    if (response.statusCode == 200) {
      final decodedData = jsonDecode(response.body)['results'] as List;
      return decodedData.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception('Something happened');
    }
  }

  Future<List<Movie>> getTopRatedMovies() async {
    final response = await get(Uri.parse(_topRatedUrl));
    if (response.statusCode == 200) {
      final decodedData = jsonDecode(response.body)['results'] as List;
      return decodedData.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception('Something happened');
    }
  }

  Future<List<Movie>> getUpcommingMovies() async {
    final response = await get(Uri.parse(_upcommingUrl));
    if (response.statusCode == 200) {
      final decodedData = jsonDecode(response.body)['results'] as List;
      return decodedData.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception('Something happened');
    }
  }
}
