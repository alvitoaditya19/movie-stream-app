import 'package:flutter/cupertino.dart';
import 'package:movie_stream_app/models/movie.dart';
import 'package:movie_stream_app/services/movie_services.dart';
import 'package:movie_stream_app/shared/theme.dart';

enum MovieState { None, Loading, HasData, NoData, Error }

class MovieProvider extends ChangeNotifier {
  List<MovieModel> _movies = [];

  MovieState _state = MovieState.None;
  String? _message;

    MovieProvider() {
   getMovies() ;
  }

  List<MovieModel> get movies => _movies;

  MovieState get state => _state;
  String get message => _message!;

  set movies(List<MovieModel> movies) {
    _movies = movies;
    notifyListeners();
  }

  Future<dynamic> getMovies() async {
    try {
      _state = MovieState.Loading;
      // notifyListeners();

      List<MovieModel> movies = await MovieService().getMovies();

      if (movies.isEmpty) {
        _state = MovieState.NoData;
        notifyListeners();

        return _message = "Data tidak ditemukan!";
      } else {
        _state = MovieState.HasData;
        notifyListeners();

        return _movies = movies;
      }
    } catch (e) {
      print(e);
    }
  }
  
}
