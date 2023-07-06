
import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../home/data/models/home_model.dart';

abstract class CategoriesMoviesListDataSources {
  

  Future<Either<Failures, HomeModel>> moviesByCategory(String id);
}
