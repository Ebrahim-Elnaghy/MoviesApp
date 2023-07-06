import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../data/models/movie_details_model.dart';
import '../repositories/movie_details_domain_repo.dart';
class AddMovieToFireStoreUseCase {
  MovieDetailsDomainRepo movieDetailsDomainRepo;

  AddMovieToFireStoreUseCase({required this.movieDetailsDomainRepo});

  Future<Either<Failures, Future<void>>> call(MovieDetailsModel movie) =>
      movieDetailsDomainRepo.addMovieToFireStore(movie);
}
