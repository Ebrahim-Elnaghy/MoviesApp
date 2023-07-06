import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/home_entity.dart';
import '../repositories/home_domain_repo.dart';

class UpcomingUseCase {
  HomeDomainRepo homeDomainRepo;

  UpcomingUseCase({required this.homeDomainRepo});

  Future<Either<Failures, HomeEntity>> call() => homeDomainRepo.upcoming();
}
