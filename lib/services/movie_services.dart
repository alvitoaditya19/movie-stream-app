import 'dart:convert';
import 'package:movie_stream_app/models/movie.dart';
import 'package:movie_stream_app/shared/shared_value.dart';

import 'package:http/http.dart' as http;

class MovieService {
  String basedUrl = "https://api.themoviedb.org/3/discover/movie?api_key=${apiKey}&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false&page=1";

  Future<List<MovieModel>> getMovies() async {
    try {
      Uri apiUrl = Uri.parse(basedUrl);

      final response = await http.get(apiUrl);
      List jsonObject = jsonDecode(response.body)["results"];

      return jsonObject.map((e) => MovieModel.fromJson(e)).toList();
    } catch (e) {
      print(e);
      throw Exception(e);
    }
  }

}