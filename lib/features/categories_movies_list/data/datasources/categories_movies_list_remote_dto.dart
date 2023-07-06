

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/api/end_points.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/utils/constants.dart';
import '../../../home/data/models/home_model.dart';
import 'categories_movies_list_data_sources.dart';

class CategoriesMoviesListRemoteDto implements CategoriesMoviesListDataSources {
  Dio dio = Dio();

  CategoriesMoviesListRemoteDto() {
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
}
