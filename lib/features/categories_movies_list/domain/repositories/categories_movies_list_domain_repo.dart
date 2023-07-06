
import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../home/domain/entities/home_entity.dart';

abstract class CategoriesMoviesListDomainRepo {
  
  Future<Either<Failures, HomeEntity>> moviesByCategory(String id);


}
