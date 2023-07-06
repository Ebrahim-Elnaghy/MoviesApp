part of 'categories_movies_list_cubit.dart';

abstract class CategoriesMoviesListState  {
  const CategoriesMoviesListState();

  
}

class CategoriesMoviesListInitial extends CategoriesMoviesListState {}

class CategoriesMoviesListLoadingState extends CategoriesMoviesListState {}

class GetMoviesByCategorySuccessState extends CategoriesMoviesListState {}

class GetMoviesByCategoryErrorState extends CategoriesMoviesListState {
  Failures failures;

  GetMoviesByCategoryErrorState({required this.failures});
}



