// ignore_for_file: must_be_immutable

import '../../domain/entities/category_entity.dart';

class CategoryModel extends CategoryEntity {
   CategoryModel({
    super.genres,
  });

  CategoryModel.fromJson(dynamic json) {
    if (json['genres'] != null) {
      genres = [];
      json['genres'].forEach((v) {
        genres?.add(Genres.fromJson(v));
      });
    }
  }
}

class Genres extends GenresEntity {
   Genres({
    super.id,
    super.name,
  });

  Genres.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
  }
}
