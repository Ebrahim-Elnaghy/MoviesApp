// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/home_entity.dart';
import '../repositories/home_domain_repo.dart';

class NowPlayingUseCase {
  HomeDomainRepo homeDomainRepo;

  NowPlayingUseCase({
    required this.homeDomainRepo,
  });

  Future<Either<Failures, HomeEntity>> call() => homeDomainRepo.popular();
}
