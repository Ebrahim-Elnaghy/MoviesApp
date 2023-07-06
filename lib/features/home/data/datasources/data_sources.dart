import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../movie_details/data/models/movie_details_model.dart';
import '../models/category_model.dart';
import '../models/home_model.dart';

abstract class HomeDataSources {
  Future<Either<Failures, HomeModel>> upcoming();

  Future<Either<Failures, HomeModel>> nowPlaying();

  Future<Either<Failures, HomeModel>> popular();

  Future<Either<Failures, HomeModel>> topRated();

  Future<Either<Failures, CategoryModel>> categories();

  Future<Either<Failures, HomeModel>> search(String keyword);

  Future<Either<Failures, HomeModel>> moviesByCategory(String id);




  Future<Either<Failures, Stream<QuerySnapshot<MovieDetailsModel>>>> getMoviesFromFireStore();


}
