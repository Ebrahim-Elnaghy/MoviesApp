import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../repositories/movie_details_domain_repo.dart';

class SearchMoviesByIdInFireStoreUseCase {
  MovieDetailsDomainRepo movieDetailsDomainRepo;

  SearchMoviesByIdInFireStoreUseCase({required this.movieDetailsDomainRepo});

  Future<Either<Failures, bool>> call(String id) =>
      movieDetailsDomainRepo.searchMoviesByIdInFireStore(id);
}
