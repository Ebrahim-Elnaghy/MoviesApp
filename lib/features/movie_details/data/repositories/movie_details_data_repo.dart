import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../domain/repositories/movie_details_domain_repo.dart';
import '../datasources/data_sources.dart';
import '../models/credits_model.dart';
import '../models/movie_details_model.dart';
import '../models/similar_model.dart';

class MovieDetailsDataRepo implements MovieDetailsDomainRepo {
  MovieDetailsDataSources movieDetailsDataSources;

  MovieDetailsDataRepo({required this.movieDetailsDataSources});

  @override
  Future<Either<Failures, MovieDetailsModel>> details(String movieID) =>
      movieDetailsDataSources.details(movieID);

  @override
  Future<Either<Failures, CreditsModel>> credits(String movieID) =>
      movieDetailsDataSources.credits(movieID);

  @override
  Future<Either<Failures, SimilarModel>> similar(String movieID) => movieDetailsDataSources.similar(movieID);
  @override
  Future<Either<Failures, Future<void>>> addMovieToFireStore(MovieDetailsModel movie)=>movieDetailsDataSources.addMovieToFireStore(movie);

  @override
  Future<Either<Failures, Future<void>>> deleteMovieFromFireStore(String id) =>movieDetailsDataSources.deleteMovieFromFireStore(id);

  @override
  Future<Either<Failures, bool>> searchMoviesByIdInFireStore(String id) =>movieDetailsDataSources.searchMoviesByIdInFireStore(id);
}
