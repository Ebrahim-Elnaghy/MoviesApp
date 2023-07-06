// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

class MovieDetailsEntity extends Equatable {
  MovieDetailsEntity({
    this.backdropPath,
    this.belongsToCollection,
    this.genres,
    this.id,
    this.overview,
    this.releaseDate,
    this.tagline,
    this.title,
    this.video,
    this.voteAverage,
  });

   String? backdropPath;
   BelongsToCollectionEntity? belongsToCollection;
   List<GenresEntity>? genres;
   num? id;
   String? overview;
   String? releaseDate;
   String? tagline;
   String? title;
   bool? video;
   num? voteAverage;

  @override
  List<Object?> get props => [
        backdropPath,
        genres,
        id,
        overview,
        releaseDate,
        tagline,
        title,
        video,
        voteAverage,
      ];

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['backdrop_path'] = backdropPath;
    if (belongsToCollection != null) {
      map['belongs_to_collection'] = belongsToCollection?.toJson();
    }
    if (genres != null) {
      map['genres'] = genres?.map((v) => v.toJson()).toList();
    }
    map['id'] = id;
    map['overview'] = overview;
    map['release_date'] = releaseDate;
    map['tagline'] = tagline;
    map['title'] = title;
    map['video'] = video;
    map['vote_average'] = voteAverage;
    return map;
  }
}

class GenresEntity extends Equatable {
  GenresEntity({
    this.id,
    this.name,
  });

   num? id;
   String? name;

  @override
  List<Object?> get props => [
        id,
        name,
      ];

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    return map;
  }
}

class BelongsToCollectionEntity extends Equatable {
  BelongsToCollectionEntity({
    this.posterPath,
    this.backdropPath,
  });

   String? posterPath;
   String? backdropPath;

  @override
  List<Object?> get props => [
        posterPath,
        backdropPath,
      ];

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['poster_path'] = posterPath;
    map['backdrop_path'] = backdropPath;
    return map;
  }
}
