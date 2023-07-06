import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../repositories/movie_details_domain_repo.dart';

class DeleteMovieFromFireStoreUseCase {
  MovieDetailsDomainRepo movieDetailsDomainRepo;

  DeleteMovieFromFireStoreUseCase({required this.movieDetailsDomainRepo});

  Future<Either<Failures, Future<void>>> call(String id) =>
      movieDetailsDomainRepo.deleteMovieFromFireStore(id);
}
