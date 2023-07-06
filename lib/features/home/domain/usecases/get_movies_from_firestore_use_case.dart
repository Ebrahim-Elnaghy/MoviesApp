import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../movie_details/data/models/movie_details_model.dart';
import '../repositories/home_domain_repo.dart';

class GetMoviesFromFireStoreUseCase {
  HomeDomainRepo homeDomainRepo;

  GetMoviesFromFireStoreUseCase({required this.homeDomainRepo});

  Future<Either<Failures, Stream<QuerySnapshot<MovieDetailsModel>>>> call() =>
      homeDomainRepo.getMoviesFromFireStore();
}
