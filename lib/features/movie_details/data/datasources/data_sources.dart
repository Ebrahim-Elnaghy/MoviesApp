import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../models/credits_model.dart';
import '../models/movie_details_model.dart';
import '../models/similar_model.dart';

abstract class MovieDetailsDataSources {
  Future<Either<Failures, MovieDetailsModel>> details(String movieID);
  Future<Either<Failures, CreditsModel>> credits(String movieID);
  Future<Either<Failures, SimilarModel>> similar(String movieID);
  Future<Either<Failures, Future<void>>> addMovieToFireStore(MovieDetailsModel movie);

  Future<Either<Failures, Future<void>>> deleteMovieFromFireStore(String id);

  Future<Either<Failures, bool>> searchMoviesByIdInFireStore(String id);
}
