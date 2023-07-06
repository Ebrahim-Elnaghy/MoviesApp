import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/similar_entity.dart';
import '../repositories/movie_details_domain_repo.dart';

class SimilarUseCase {
  MovieDetailsDomainRepo movieDetailsDomainRepo;

  SimilarUseCase({required this.movieDetailsDomainRepo});

  Future<Either<Failures, SimilarEntity>> call(String movieID) =>
      movieDetailsDomainRepo.similar(movieID);
}
