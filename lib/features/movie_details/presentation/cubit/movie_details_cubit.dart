import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/error/failures.dart';
import '../../data/datasources/data_sources.dart';
import '../../data/models/movie_details_model.dart';
import '../../data/repositories/movie_details_data_repo.dart';
import '../../domain/entities/credits_entity.dart';
import '../../domain/entities/movie_details_entity.dart';
import '../../domain/entities/similar_entity.dart';
import '../../domain/repositories/movie_details_domain_repo.dart';
import '../../domain/usecases/add_movie_to_firestore_use_case.dart';
import '../../domain/usecases/delete_movie_from_firestore_use_case.dart';
import '../../domain/usecases/get_credits_use_case.dart';
import '../../domain/usecases/get_details_use_case.dart';
import '../../domain/usecases/get_similar_use_case.dart';
import '../../domain/usecases/search_movies_by_id_in_firestore_use_case.dart';

part 'movie_details_state.dart';

class MovieDetailsCubit extends Cubit<MovieDetailsState> {
  MovieDetailsDataSources movieDetailsDataSources;
  late MovieDetailsDomainRepo movieDetailsDomainRepo;
  MovieDetailsEntity? movieDetails = MovieDetailsEntity();
  CreditsEntity? actors = CreditsEntity();
  SimilarEntity moreLikeThis = SimilarEntity();
  bool isAdded =false;


  MovieDetailsCubit({required this.movieDetailsDataSources})
      : super(MovieDetailsInitial()) {
    movieDetailsDomainRepo =
        MovieDetailsDataRepo(movieDetailsDataSources: movieDetailsDataSources);
  }

  static MovieDetailsCubit get(context) => BlocProvider.of(context);

  void details(String movieID) async {
    emit(MovieDetailsLoadingState());
    DetailsUseCase detailsUseCase =
        DetailsUseCase(movieDetailsDomainRepo: movieDetailsDomainRepo);
    var result = await detailsUseCase.call(movieID);
    result.fold((l) {
      emit(MovieDetailsGetDetailsErrorState(failures: l));
    }, (r) {
      movieDetails = r;
      emit(MovieDetailsGetDetailsSuccessState());
    });
  }


  changeWatchList(){
    isAdded=!isAdded;
    emit(MovieDetailsChangeWatchListState());
  }
  void credits(String movieID) async {
    emit(MovieDetailsLoadingState());
    CreditsUseCase creditsUseCase =
        CreditsUseCase(movieDetailsDomainRepo: movieDetailsDomainRepo);
    var result = await creditsUseCase.call(movieID);
    result.fold((l) {
      emit(MovieDetailsGetCreditsErrorState(failures: l));
    }, (r) {
      actors = r;
      emit(MovieDetailsGetCreditsSuccessState());
    });
  }

  void similar(String movieID) async {
    emit(MovieDetailsLoadingState());
    SimilarUseCase similarUseCase =
        SimilarUseCase(movieDetailsDomainRepo: movieDetailsDomainRepo);
    var result = await similarUseCase.call(movieID);
    result.fold((l) {
      emit(MovieDetailsGetSimilarErrorState(failures: l));
    }, (r) {
      moreLikeThis = r;
      emit(MovieDetailsGetSimilarSuccessState());
    });
  }

  void addMovieToFireStore(MovieDetailsModel movie) async {
    emit(MovieDetailsLoadingState());
    AddMovieToFireStoreUseCase addMovieToFireStoreUseCase =
    AddMovieToFireStoreUseCase(movieDetailsDomainRepo: movieDetailsDomainRepo);
    var result = await addMovieToFireStoreUseCase.call(movie);
    result.fold((l) {
      emit(MovieDetailsAddMovieToFireStoreErrorState(failures: l));
    }, (r) {
      emit(MovieDetailsAddMovieToFireStoreSuccessState());
    });
  }

  void deleteMovieFromFireStore(String id) async {
    emit(MovieDetailsLoadingState());
    DeleteMovieFromFireStoreUseCase deleteMovieFromFireStoreUseCase =
    DeleteMovieFromFireStoreUseCase(movieDetailsDomainRepo: movieDetailsDomainRepo);
    var result = await deleteMovieFromFireStoreUseCase.call(id);
    result.fold((l) {
      emit(MovieDetailsDeleteMovieFromFireStoreErrorState(failures: l));
    }, (r) {
      emit(MovieDetailsDeleteMovieFromFireStoreSuccessState());
    });
  }

  void searchMoviesByIdInFireStore(String id) async {
    emit(MovieDetailsLoadingState());
    SearchMoviesByIdInFireStoreUseCase searchMoviesByIdInFireStoreUseCase =
    SearchMoviesByIdInFireStoreUseCase(movieDetailsDomainRepo: movieDetailsDomainRepo);
    var result = await searchMoviesByIdInFireStoreUseCase.call(id);
    result.fold((l) {
      emit(MovieDetailsSearchMoviesByIdInFireStoreErrorState(failures: l));
    }, (r) {
      isAdded=r;
      emit(MovieDetailsSearchMoviesByIdInFireStoreSuccessState());
    });
  }
}
