import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/credits_entity.dart';
import '../repositories/movie_details_domain_repo.dart';

class CreditsUseCase {
  MovieDetailsDomainRepo movieDetailsDomainRepo;

  CreditsUseCase({required this.movieDetailsDomainRepo});

  Future<Either<Failures, CreditsEntity>> call(String movieID) =>
      movieDetailsDomainRepo.credits(movieID);
}
