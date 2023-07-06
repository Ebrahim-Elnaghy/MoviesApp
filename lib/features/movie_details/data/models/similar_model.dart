
// ignore_for_file: must_be_immutable

import '../../domain/entities/similar_entity.dart';

class SimilarModel extends SimilarEntity {
  SimilarModel({
    this.dates,
    this.page,
    super.results,
    this.totalPages,
    this.totalResults,
  });

  SimilarModel.fromJson(dynamic json) {
    dates = json['dates'] != null ? Dates.fromJson(json['dates']) : null;
    page = json['page'];
    if (json['results'] != null) {
      results = [];
      json['results'].forEach((v) {
        results?.add(SimilarResults.fromJson(v));
      });
    }
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }

  Dates? dates;
  num? page;
  num? totalPages;
  num? totalResults;
}

class SimilarResults extends SimilarResultsEntity {
  SimilarResults({
    this.adult,
    super.backdropPath,
    this.genreIds,
    super.id,
    this.originalLanguage,
    this.originalTitle,
    super.overview,
    this.popularity,
    super.posterPath,
    super.releaseDate,
    super.title,
    super.video,
    super.voteAverage,
    this.voteCount,
  });

  SimilarResults.fromJson(dynamic json) {
    adult = json['adult'];
    backdropPath = json['backdrop_path'];
    genreIds = json['genre_ids'] != null ? json['genre_ids'].cast<num>() : [];
    id = json['id'];
    originalLanguage = json['original_language'];
    originalTitle = json['original_title'];
    overview = json['overview'];
    popularity = json['popularity'];
    posterPath = json['poster_path'];
    releaseDate = json['release_date'];
    title = json['title'];
    video = json['video'];
    voteAverage = json['vote_average'];
    voteCount = json['vote_count'];
  }

  bool? adult;
  List<num>? genreIds;
  String? originalLanguage;
  String? originalTitle;
  num? popularity;
  num? voteCount;
}

class Dates {
  Dates({
    this.maximum,
    this.minimum,
  });

  Dates.fromJson(dynamic json) {
    maximum = json['maximum'];
    minimum = json['minimum'];
  }

  String? maximum;
  String? minimum;
}
