import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/movie_details_entity.dart';
import '../repositories/movie_details_domain_repo.dart';

class DetailsUseCase {
  MovieDetailsDomainRepo movieDetailsDomainRepo;

  DetailsUseCase({required this.movieDetailsDomainRepo});

  Future<Either<Failures, MovieDetailsEntity>> call(String movieId) =>
      movieDetailsDomainRepo.details(movieId);
}
