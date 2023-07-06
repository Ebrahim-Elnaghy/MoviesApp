// ignore_for_file: must_be_immutable

import '../../domain/entities/credits_entity.dart';

class CreditsModel extends CreditsEntity {
  CreditsModel({
    this.id,
    super.cast,
    this.crew,
  });

  CreditsModel.fromJson(dynamic json) {
    id = json['id'];
    if (json['cast'] != null) {
      cast = [];
      json['cast'].forEach((v) {
        cast?.add(Cast.fromJson(v));
      });
    }
    if (json['crew'] != null) {
      crew = [];
      json['crew'].forEach((v) {
        crew?.add(Crew.fromJson(v));
      });
    }
  }

   num? id;
   List<Crew>? crew;
}

class Crew {
  Crew({
    this.adult,
    this.gender,
    this.id,
    this.knownForDepartment,
    this.name,
    this.originalName,
    this.popularity,
    this.profilePath,
    this.creditId,
    this.department,
    this.job,
  });

  Crew.fromJson(dynamic json) {
    adult = json['adult'];
    gender = json['gender'];
    id = json['id'];
    knownForDepartment = json['known_for_department'];
    name = json['name'];
    originalName = json['original_name'];
    popularity = json['popularity'];
    profilePath = json['profile_path'];
    creditId = json['credit_id'];
    department = json['department'];
    job = json['job'];
  }

   bool? adult;
   num? gender;
   num? id;
   String? knownForDepartment;
   String? name;
   String? originalName;
   num? popularity;
   String? profilePath;
   String? creditId;
   String? department;
   String? job;
}

class Cast extends CastEntity {
  Cast({
    this.adult,
    this.gender,
    this.id,
    this.knownForDepartment,
    super.name,
    this.originalName,
    this.popularity,
    super.profilePath,
    this.castId,
    this.character,
    this.creditId,
    this.order,
  });

  Cast.fromJson(dynamic json) {
    adult = json['adult'];
    gender = json['gender'];
    id = json['id'];
    knownForDepartment = json['known_for_department'];
    name = json['name'];
    originalName = json['original_name'];
    popularity = json['popularity'];
    profilePath = json['profile_path'];
    castId = json['cast_id'];
    character = json['character'];
    creditId = json['credit_id'];
    order = json['order'];
  }

   bool? adult;
   num? gender;
   num? id;
   String? knownForDepartment;
   String? originalName;
   num? popularity;
   num? castId;
   String? character;
   String? creditId;
   num? order;
}
