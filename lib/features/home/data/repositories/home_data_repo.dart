import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../movie_details/data/models/movie_details_model.dart';
import '../../domain/repositories/home_domain_repo.dart';
import '../datasources/data_sources.dart';
import '../models/category_model.dart';
import '../models/home_model.dart';

class HomeDataRepo implements HomeDomainRepo {
  HomeDataSources homeDataSources;

  HomeDataRepo({required this.homeDataSources});

  @override
  Future<Either<Failures, HomeModel>> upcoming() => homeDataSources.upcoming();

  @override
  Future<Either<Failures, HomeModel>> nowPlaying() =>
      homeDataSources.nowPlaying();

  @override
  Future<Either<Failures, HomeModel>> popular() => homeDataSources.popular();

  @override
  Future<Either<Failures, HomeModel>> topRated() => homeDataSources.topRated();

  @override
  Future<Either<Failures, HomeModel>> search(String keyword) =>
      homeDataSources.search(keyword);

  @override
  Future<Either<Failures, CategoryModel>> categories() =>
      homeDataSources.categories();

  @override
  Future<Either<Failures, HomeModel>> moviesByCategory(String id) =>
      homeDataSources.moviesByCategory(id);

  @override
  Future<Either<Failures, Stream<QuerySnapshot<MovieDetailsModel>>>> getMoviesFromFireStore()=>homeDataSources.getMoviesFromFireStore();




}
