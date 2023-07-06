import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/api/end_points.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/utils/constants.dart';
import '../../../movie_details/data/models/movie_details_model.dart';
import '../models/category_model.dart';
import '../models/home_model.dart';
import 'data_sources.dart';

class RemoteDto implements HomeDataSources {
  Dio dio = Dio();

  RemoteDto() {
    dio.options.headers.addAll({'Authorization': Constants.apiToken});
    // dio.interceptors.add(LogInterceptor(
    //   responseBody: true,
    //   error: true,
    //   requestHeader: false,
    //   responseHeader: false,
    //   request: true,
    //   requestBody: true,
    // ));
  }

  @override
  Future<Either<Failures, HomeModel>> upcoming() async {
    try {
      var response = await dio.get('${Constants.baseUrl}${EndPoints.upcoming}');
      HomeModel homeModel = HomeModel.fromJson(response.data);
      return Right(homeModel);
    } catch (e) {
      return Left(ServerFailures(e.toString()));
    }
  }

  @override
  Future<Either<Failures, HomeModel>> nowPlaying() async {
    try {
      var response =
          await dio.get('${Constants.baseUrl}${EndPoints.nowPlaying}');
      HomeModel homeModel = HomeModel.fromJson(response.data);
      return Right(homeModel);
    } catch (e) {
      return Left(ServerFailures(e.toString()));
    }
  }

  @override
  Future<Either<Failures, HomeModel>> popular() async {
    try {
      var response = await dio.get('${Constants.baseUrl}${EndPoints.popular}');
      HomeModel homeModel = HomeModel.fromJson(response.data);
      return Right(homeModel);
    } catch (e) {
      return Left(ServerFailures(e.toString()));
    }
  }

  @override
  Future<Either<Failures, HomeModel>> topRated() async {
    try {
      var response = await dio.get('${Constants.baseUrl}${EndPoints.topRated}');
      HomeModel homeModel = HomeModel.fromJson(response.data);
      return Right(homeModel);
    } catch (e) {
      return Left(ServerFailures(e.toString()));
    }
  }

  @override
  Future<Either<Failures, HomeModel>> search(String keyword) async {
    try {
      var response = await dio.get('${Constants.baseUrl}${EndPoints.search}',
          queryParameters: {'query': keyword});
      HomeModel homeModel = HomeModel.fromJson(response.data);
      return Right(homeModel);
    } catch (e) {
      return Left(ServerFailures(e.toString()));
    }
  }

  @override
  Future<Either<Failures, CategoryModel>> categories() async {
    try {
      var response =
          await dio.get('${Constants.baseUrl}${EndPoints.categories}');
      CategoryModel categoryModel = CategoryModel.fromJson(response.data);
      return Right(categoryModel);
    } catch (e) {
      return Left(ServerFailures(e.toString()));
    }
  }

  @override
  Future<Either<Failures, HomeModel>> moviesByCategory(String id) async {
    try {
      var response = await dio.get(
          '${Constants.baseUrl}${EndPoints.moviesByCategory}',
          queryParameters: {'with_genres': id});
      HomeModel homeModel = HomeModel.fromJson(response.data);
      return Right(homeModel);
    } catch (e) {
      return Left(ServerFailures(e.toString()));
    }
  }

  ////////// Firebase ////////
  CollectionReference<MovieDetailsModel> getMovieWatchListCollection() {
    return FirebaseFirestore.instance
        .collection("watchList")
        .withConverter<MovieDetailsModel>(
          fromFirestore: (snapshot, _) => MovieDetailsModel.fromJson(snapshot.data()!),
          toFirestore: (movie, options) => movie.toJson(),
        );
  }



  @override
  Future<Either<Failures, Stream<QuerySnapshot<MovieDetailsModel>>>>
      getMoviesFromFireStore() {
    try {
      var collection = getMovieWatchListCollection();
      var stream = collection.snapshots();
      return Future.value(Right(stream));
    } catch (e) {
      return Future.value(Left(ServerFailures(e.toString())));
    }
  }


}
