// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

class CategoryEntity extends Equatable {
  CategoryEntity({
    this.genres,
  });

   List<GenresEntity>? genres;

  @override
  List<Object?> get props => [
        genres,
      ];
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
}
