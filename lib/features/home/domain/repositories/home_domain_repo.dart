import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../movie_details/data/models/movie_details_model.dart';
import '../entities/category_entity.dart';
import '../entities/home_entity.dart';

abstract class HomeDomainRepo {
  Future<Either<Failures, HomeEntity>> upcoming();
  Future<Either<Failures, HomeEntity>> nowPlaying();
  Future<Either<Failures, HomeEntity>> popular();
  Future<Either<Failures, HomeEntity>> topRated();
  Future<Either<Failures, HomeEntity>> search(String keyword);
  Future<Either<Failures, CategoryEntity>> categories();
  Future<Either<Failures, HomeEntity>> moviesByCategory(String id);


  Future<Either<Failures, Stream<QuerySnapshot<MovieDetailsModel>>>> getMoviesFromFireStore();


}
