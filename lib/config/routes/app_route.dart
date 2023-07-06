import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/categories_movies_list/data/datasources/categories_movies_list_remote_dto.dart';
import '../../features/categories_movies_list/presentation/cubit/categories_movies_list_cubit.dart';
import '../../features/categories_movies_list/presentation/pages/movies_list.dart';
import '../../features/home/data/datasources/remote_dto.dart';
import '../../features/home/domain/entities/category_entity.dart';
import '../../features/home/presentation/cubit/home_cubit.dart';
import '../../features/home/presentation/pages/home.dart';
import '../../features/movie_details/data/datasources/remote_dto.dart';
import '../../features/movie_details/presentation/cubit/movie_details_cubit.dart';
import '../../features/movie_details/presentation/pages/movie_details.dart';
import '../../features/splash/presentation/cubit/splash_cubit.dart';
import '../../features/splash/presentation/pages/splash.dart';

class Routes {
  static const String home = "home";
  static const String splash = "splash";
  static const String movieDetails = "movieDetails";
  static const String moviesList = "moviesList";
}

class AppRoutes {
  static Route onGenerate(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.home:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => HomeCubit(homeDataSources: RemoteDto())
              ..getUpcoming()
              ..getNowPlaying()
              ..getPopular()
              ..getTopRated()
              ..getCategories()
              ..getMoviesFromFireStore(),
            child: const HomeScreen(),
          ),
        );
      case Routes.splash:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => SplashCubit(),
            child: const SplashScreen(),
          ),
        );
      case Routes.movieDetails:
        String movieID = routeSettings.arguments as String;
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => MovieDetailsCubit(
                movieDetailsDataSources: MovieDetailsRemoteDto())
              ..searchMoviesByIdInFireStore(movieID)
              ..details(movieID)
              ..credits(movieID)
              ..similar(movieID),
            child: const MovieDetails(),
          ),
        );
      case Routes.moviesList:
        GenresEntity category = routeSettings.arguments as GenresEntity;
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => CategoriesMoviesListCubit(
                categoriesMoviesListDataSources:
                    CategoriesMoviesListRemoteDto())
              ..moviesByCategory(category.id.toString()),
            child: MoviesList(category.name ?? ''),
          ),
        );

      default:
        return MaterialPageRoute(
          builder: (context) => unDefineRoute(),
        );
    }
  }

  static Widget unDefineRoute() => const Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(child: Text("UnDefine Route Page")),
          ],
        ),
      );
}
