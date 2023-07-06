part of 'home_cubit.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeChangeBottomNavState extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeGetUpcomingSuccessState extends HomeState {}

class HomeGetUpcomingErrorState extends HomeState {
  Failures failures;

  HomeGetUpcomingErrorState({required this.failures});
}

class HomeGetNowPlayingSuccessState extends HomeState {}

class HomeGetNowPlayingErrorState extends HomeState {
  Failures failures;

  HomeGetNowPlayingErrorState({required this.failures});
}

class HomeGetPopularSuccessState extends HomeState {}

class HomeGetPopularErrorState extends HomeState {
  Failures failures;

  HomeGetPopularErrorState({required this.failures});
}

class HomeGetTopRatedSuccessState extends HomeState {}

class HomeGetTopRatedErrorState extends HomeState {
  Failures failures;

  HomeGetTopRatedErrorState({required this.failures});
}

class HomeSearchSuccessState extends HomeState {}

class HomeSearchErrorState extends HomeState {
  Failures failures;

  HomeSearchErrorState({required this.failures});
}

class HomeGetCategoriesSuccessState extends HomeState {}

class HomeGetCategoriesErrorState extends HomeState {
  Failures failures;

  HomeGetCategoriesErrorState({required this.failures});
}



class HomeGetMoviesFromFireStoreSuccessState extends HomeState {}

class HomeGetMoviesFromFireStoreErrorState extends HomeState {
  Failures failures;

  HomeGetMoviesFromFireStoreErrorState({required this.failures});
}





