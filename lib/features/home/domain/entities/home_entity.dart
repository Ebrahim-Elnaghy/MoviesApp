
// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

class HomeEntity extends Equatable {
   HomeEntity({
    this.results,
  });

   List<ResultsEntity>? results;

  @override
  List<Object?> get props => [results];
}

class ResultsEntity extends Equatable {
  ResultsEntity({
    this.backdropPath,
    this.id,
    this.overview,
    this.posterPath,
    this.releaseDate,
    this.title,
    this.video,
    this.voteAverage,
  });

   String? backdropPath;
   num? id;
   String? overview;
   String? posterPath;
   String? releaseDate;
   String? title;
   bool? video;
   num? voteAverage;

  @override
  List<Object?> get props => [
        backdropPath,
        id,
        overview,
        posterPath,
        releaseDate,
        title,
        video,
        voteAverage,
      ];
}
