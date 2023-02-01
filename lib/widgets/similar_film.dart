import 'package:flutter/material.dart';
import 'package:movie_stream_app/models/movie.dart';
import 'package:movie_stream_app/shared/shared_value.dart';

class SimilarFilm extends StatelessWidget {
  final MovieModel? movie;
  const SimilarFilm(this.movie, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 136,
      height: 160,
      margin: EdgeInsets.only(right: 14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(imageBaseURL +
              "w500" +
              (movie!.backdropPath! ?? movie!.posterPath!)),
        ),
      ),
    );
  }
}
