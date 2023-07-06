import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/api/end_points.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/utils/constants.dart';
import '../models/credits_model.dart';
import '../models/movie_details_model.dart';
import '../models/similar_model.dart';
import 'data_sources.dart';

class MovieDetailsRemoteDto implements MovieDetailsDataSources {
  Dio dio = Dio();

  MovieDetailsRemoteDto() {
    dio.options.headers.addAll({'Authorization': Constants.apiToken});
    dio.interceptors.add(LogInterceptor(
      responseBody: true,
      error: true,
      requestHeader: false,
      responseHeader: false,
      request: true,
      requestBody: true,
    ));
  }

  @override
  Future<Either<Failures, MovieDetailsModel>> details(String movieID) async {
    try {
      var response =
      await dio.get('${Constants.baseUrl}${EndPoints.details}/$movieID');
      MovieDetailsModel movieDetailsModel =
      MovieDetailsModel.fromJson(response.data);
      return Right(movieDetailsModel);
    } catch (e) {
      return Left(ServerFailures(e.toString()));
    }
  }

  @override
  Future<Either<Failures, CreditsModel>> credits(String movieID) async {
    try {
      var response = await dio.get(
          '${Constants.baseUrl}${EndPoints.details}/$movieID/${EndPoints
              .credits}');
      CreditsModel creditsModel = CreditsModel.fromJson(response.data);
      return Right(creditsModel);
    } catch (e) {
      return Left(ServerFailures(e.toString()));
    }
  }

  @override
  Future<Either<Failures, SimilarModel>> similar(String movieID) async {
    try {
      var response = await dio.get(
          '${Constants.baseUrl}${EndPoints.details}/$movieID/${EndPoints
              .similar}');
      SimilarModel similarModel = SimilarModel.fromJson(response.data);
      return Right(similarModel);
    } catch (e) {
      return Left(ServerFailures(e.toString()));
    }
  }

  CollectionReference<MovieDetailsModel> getMovieWatchListCollection() {
    return FirebaseFirestore.instance
        .collection("watchList")
        .withConverter<MovieDetailsModel>(
      fromFirestore: (snapshot, _) =>
          MovieDetailsModel.fromJson(snapshot.data()!),
      toFirestore: (movie, options) => movie.toJson(),
    );
  }

  @override
  Future<Either<Failures, Future<void>>> deleteMovieFromFireStore(String id) {
    try {
      var collection = getMovieWatchListCollection();
      var delete = collection.doc(id).delete();
      return Future.value(Right(delete));
    } catch (e) {
      return Future.value(Left(ServerFailures(e.toString())));
    }
  }

  @override
  Future<Either<Failures, bool>> searchMoviesByIdInFireStore(String id) async {
    try {
      var collection = getMovieWatchListCollection();
      var snapshot = await collection.doc(id).get();
      var result = snapshot.exists;
      return Future.value(Right(result));
    } catch (e) {
      return Future.value(Left(ServerFailures(e.toString())));
    }
  }

  @override
  Future<Either<Failures, Future<void>>> addMovieToFireStore(MovieDetailsModel movie) {
    try {
      var collections = getMovieWatchListCollection();
      var docRef = collections.doc(movie.id.toString());

      return Future.value(Right(docRef.set(movie)));
    } catch (e) {
      return Future.value(Left(ServerFailures(e.toString())));
    }
  }

}
