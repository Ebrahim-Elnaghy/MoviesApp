// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

class CreditsEntity extends Equatable {
  CreditsEntity({
    this.cast,
  });

  List<CastEntity>? cast;

  @override
  List<Object?> get props => [
        cast,
      ];
}

class CastEntity extends Equatable {
  CastEntity({
    this.name,
    this.profilePath,
  });

  String? name;
   String? profilePath;

  @override
  List<Object?> get props => [
        name,
        profilePath,
      ];
}
