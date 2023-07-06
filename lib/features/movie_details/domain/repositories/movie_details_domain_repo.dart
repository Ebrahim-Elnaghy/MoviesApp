import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../data/models/movie_details_model.dart';
import '../entities/credits_entity.dart';
import '../entities/movie_details_entity.dart';
import '../entities/similar_entity.dart';

abstract class MovieDetailsDomainRepo {

  Future<Either<Failures, MovieDetailsEntity>> details(String movieID);
  Future<Either<Failures, CreditsEntity>> credits(String movieID);
  Future<Either<Failures, SimilarEntity>> similar(String movieID);
  Future<Either<Failures, Future<void>>> addMovieToFireStore(MovieDetailsModel movie);
  Future<Either<Failures, Future<void>>> deleteMovieFromFireStore(String id);
  Future<Either<Failures, bool>> searchMoviesByIdInFireStore(String id);

}
