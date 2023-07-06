import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/error/failures.dart';
import '../../../movie_details/data/models/movie_details_model.dart';
import '../../data/datasources/data_sources.dart';
import '../../data/repositories/home_data_repo.dart';
import '../../domain/entities/category_entity.dart';
import '../../domain/entities/home_entity.dart';
import '../../domain/repositories/home_domain_repo.dart';
import '../../domain/usecases/get_categories_use_case.dart';
import '../../domain/usecases/get_movies_from_firestore_use_case.dart';
import '../../domain/usecases/get_now_playing_use_case.dart';
import '../../domain/usecases/get_popular_use_case.dart';
import '../../domain/usecases/get_top_rated_use_case.dart';
import '../../domain/usecases/get_upcoming_use_case.dart';
import '../../domain/usecases/search_use_case.dart';
import '../pages/tabs/categories.dart';
import '../pages/tabs/movies.dart';
import '../pages/tabs/search.dart';
import '../pages/tabs/watch_list.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeDataSources homeDataSources;
  late HomeDomainRepo homeDomainRepo;
  List<ResultsEntity> upcoming = [];
  List<ResultsEntity> nowPlaying = [];
  List<ResultsEntity> popular = [];
  List<ResultsEntity> topRated = [];
  List<ResultsEntity> searchList = [];
  List<GenresEntity> categories = [];
  List<MovieDetailsModel> watchList = [];

  HomeCubit({required this.homeDataSources}) : super(HomeInitial()) {
    homeDomainRepo = HomeDataRepo(homeDataSources: homeDataSources);
  }

  static HomeCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  List<Widget> screens = [
    const MoviesScreen(),
    const SearchScreen(),
    const CategoriesScreen(),
    const WatchlistScreen(),
  ];

  void changeBottomNav(int index) {
    currentIndex = index;
    emit(HomeChangeBottomNavState());
  }

  void getUpcoming() async {
    emit(HomeLoadingState());

    UpcomingUseCase upcomingUseCase =
        UpcomingUseCase(homeDomainRepo: homeDomainRepo);
    var result = await upcomingUseCase.call();
    result.fold((l) {
      emit(HomeGetUpcomingErrorState(failures: l));
    }, (r) {
      upcoming = r.results!;
      emit(HomeGetUpcomingSuccessState());
    });
  }

  void getNowPlaying() async {
    emit(HomeLoadingState());

    NowPlayingUseCase nowPlayingUseCase =
        NowPlayingUseCase(homeDomainRepo: homeDomainRepo);
    var result = await nowPlayingUseCase.call();
    result.fold((l) {
      emit(HomeGetNowPlayingErrorState(failures: l));
    }, (r) {
      nowPlaying = r.results!;
      emit(HomeGetNowPlayingSuccessState());
    });
  }

  void getPopular() async {
    emit(HomeLoadingState());
    PopularUseCase popularUseCase =
        PopularUseCase(homeDomainRepo: homeDomainRepo);
    var result = await popularUseCase.call();
    result.fold((l) {
      emit(HomeGetPopularErrorState(failures: l));
    }, (r) {
      popular = r.results!;
      emit(HomeGetPopularSuccessState());
    });
  }

  void getTopRated() async {
    emit(HomeLoadingState());
    TopRatedUseCase topRatedUseCase =
        TopRatedUseCase(homeDomainRepo: homeDomainRepo);
    var result = await topRatedUseCase.call();
    result.fold((l) {
      emit(HomeGetTopRatedErrorState(failures: l));
    }, (r) {
      topRated = r.results!;
      emit(HomeGetTopRatedSuccessState());
    });
  }

  void search(String keyword) async {
    emit(HomeLoadingState());
    SearchUseCase searchUseCase = SearchUseCase(homeDomainRepo: homeDomainRepo);
    var result = await searchUseCase.call(keyword);
    result.fold((l) {
      emit(HomeSearchErrorState(failures: l));
    }, (r) {
      searchList = r.results!;
      emit(HomeSearchSuccessState());
    });
  }

  void getCategories() async {
    emit(HomeLoadingState());
    CategoryUseCase categoryUseCase =
        CategoryUseCase(homeDomainRepo: homeDomainRepo);
    var result = await categoryUseCase.call();
    result.fold((l) {
      emit(HomeGetCategoriesErrorState(failures: l));
    }, (r) {
      categories = r.genres!;
      emit(HomeGetCategoriesSuccessState());
    });
  }

  

  void getMoviesFromFireStore() async {
    emit(HomeLoadingState());

    GetMoviesFromFireStoreUseCase getMoviesFromFireStoreUseCase =
        GetMoviesFromFireStoreUseCase(homeDomainRepo: homeDomainRepo);
    var result = await getMoviesFromFireStoreUseCase.call();
    result.fold((l) {
      emit(HomeGetMoviesFromFireStoreErrorState(failures: l));
    }, (r) {
      r.listen((event) {
        watchList = event.docs.map((e) => e.data()).toList();
        emit(HomeGetMoviesFromFireStoreSuccessState());

      });
    });
  }
}
