
import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../home/domain/entities/home_entity.dart';
import '../repositories/categories_movies_list_domain_repo.dart';

class MoviesByCategoryUseCase {
  CategoriesMoviesListDomainRepo categoriesMoviesListDomainRepo;

  MoviesByCategoryUseCase({required this.categoriesMoviesListDomainRepo});

  Future<Either<Failures, HomeEntity>> call(String id) =>
      categoriesMoviesListDomainRepo.moviesByCategory(id);
}
