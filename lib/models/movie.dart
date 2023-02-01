import 'package:flutter/material.dart';

class MovieModel {
  final int? id;
  final String? title;
  final double? voteAverage;
  final String? overview;
  final String? posterPath;
  final String? backdropPath;
  final DateTime? releaseDate;

  MovieModel(
      {this.id,
      this.title,
      this.voteAverage,
      this.overview,
      this.posterPath,
      this.backdropPath,
      this.releaseDate });

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
        id: json['id'] ?? 0,
        title: json['title'] ?? "",
        voteAverage: (json['vote_average'] as num).toDouble(),
        overview: json['overview'] ?? "",
        posterPath: json['poster_path'] ?? "",
        backdropPath: json['backdrop_path'] ?? "",
        releaseDate:DateTime.parse(json['release_date'])
        )
        ;
  }

    Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'voteAverage': voteAverage,
      'overview': overview,
      'posterPath': posterPath,
      'backdropPath': backdropPath!,
      'releaseDate': releaseDate!,

    };
  }
}

class UninitializedMovieModel extends MovieModel {}