part of 'movie_details_cubit.dart';

abstract class MovieDetailsState {
  const MovieDetailsState();
}

class MovieDetailsInitial extends MovieDetailsState {}

class MovieDetailsLoadingState extends MovieDetailsState {}

class MovieDetailsGetDetailsSuccessState extends MovieDetailsState {}

class MovieDetailsGetDetailsErrorState extends MovieDetailsState {
  Failures failures;

  MovieDetailsGetDetailsErrorState({required this.failures});
}

class MovieDetailsGetCreditsSuccessState extends MovieDetailsState {}

class MovieDetailsGetCreditsErrorState extends MovieDetailsState {
  Failures failures;

  MovieDetailsGetCreditsErrorState({required this.failures});
}

class MovieDetailsGetSimilarSuccessState extends MovieDetailsState {}

class MovieDetailsGetSimilarErrorState extends MovieDetailsState {
  Failures failures;

  MovieDetailsGetSimilarErrorState({required this.failures});
}

class MovieDetailsAddMovieToFireStoreSuccessState extends MovieDetailsState {}

class MovieDetailsAddMovieToFireStoreErrorState extends MovieDetailsState {
  Failures failures;

  MovieDetailsAddMovieToFireStoreErrorState({required this.failures});
}

class MovieDetailsDeleteMovieFromFireStoreSuccessState extends MovieDetailsState {}

class MovieDetailsDeleteMovieFromFireStoreErrorState extends MovieDetailsState {
  Failures failures;

  MovieDetailsDeleteMovieFromFireStoreErrorState({required this.failures});
}

class MovieDetailsChangeWatchListState extends MovieDetailsState {}

class MovieDetailsSearchMoviesByIdInFireStoreSuccessState extends MovieDetailsState {}

class MovieDetailsSearchMoviesByIdInFireStoreErrorState extends MovieDetailsState {
  Failures failures;

  MovieDetailsSearchMoviesByIdInFireStoreErrorState({required this.failures});
}

