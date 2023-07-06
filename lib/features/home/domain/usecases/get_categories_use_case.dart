import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/category_entity.dart';
import '../repositories/home_domain_repo.dart';

class CategoryUseCase {
  HomeDomainRepo homeDomainRepo;

  CategoryUseCase({required this.homeDomainRepo});

  Future<Either<Failures, CategoryEntity>> call() => homeDomainRepo.categories();
}
