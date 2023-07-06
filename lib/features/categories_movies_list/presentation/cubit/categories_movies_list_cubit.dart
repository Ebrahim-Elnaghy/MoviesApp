import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/error/failures.dart';
import '../../../home/domain/entities/home_entity.dart';
import '../../data/datasources/categories_movies_list_data_sources.dart';
import '../../data/repositories/categories_movies_list_data_repo.dart';
import '../../domain/repositories/categories_movies_list_domain_repo.dart';
import '../../domain/usecases/get_movies_by_category_use_case.dart';

part 'categories_movies_list_state.dart';

class CategoriesMoviesListCubit extends Cubit<CategoriesMoviesListState> {
  CategoriesMoviesListDataSources categoriesMoviesListDataSources;
  late CategoriesMoviesListDomainRepo categoriesMoviesListDomainRepo;
  List<ResultsEntity> moviesList = [];

  CategoriesMoviesListCubit({required this.categoriesMoviesListDataSources})
      : super(CategoriesMoviesListInitial()) {
    categoriesMoviesListDomainRepo = CategoriesMoviesListDataRepo(
        categoriesMoviesListDataSources: categoriesMoviesListDataSources);
  }

  static CategoriesMoviesListCubit get(context)=> BlocProvider.of(context);

  void moviesByCategory(String id) async {
    emit(CategoriesMoviesListLoadingState());
    MoviesByCategoryUseCase moviesByCategoryUseCase =
        MoviesByCategoryUseCase(categoriesMoviesListDomainRepo: categoriesMoviesListDomainRepo);
    var result = await moviesByCategoryUseCase.call(id);
    result.fold((l) {
      emit(GetMoviesByCategoryErrorState(failures: l));
    }, (r) {
      moviesList = r.results!;
      emit(GetMoviesByCategorySuccessState());
    });
  }
}
