

import 'package:dartz/dartz.dart';
import '../datasources/categories_movies_list_data_sources.dart';

import '../../../../core/error/failures.dart';
import '../../../home/data/models/home_model.dart';
import '../../domain/repositories/categories_movies_list_domain_repo.dart';

class CategoriesMoviesListDataRepo implements CategoriesMoviesListDomainRepo {
  CategoriesMoviesListDataSources categoriesMoviesListDataSources;

  CategoriesMoviesListDataRepo({required this.categoriesMoviesListDataSources});



  @override
  Future<Either<Failures, HomeModel>> moviesByCategory(String id) =>
      categoriesMoviesListDataSources.moviesByCategory(id);
}
