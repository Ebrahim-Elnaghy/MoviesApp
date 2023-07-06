import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../config/routes/app_route.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/constants.dart';
import '../../../home/presentation/widgets/custom_text.dart';
import '../cubit/categories_movies_list_cubit.dart';

class MoviesList extends StatelessWidget {
  final String categoryName;
  const MoviesList(this.categoryName, {super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CategoriesMoviesListCubit, CategoriesMoviesListState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is CategoriesMoviesListLoadingState) {
          return const Center(
            child: CircularProgressIndicator(
              color: AppColors.primary,
            ),
          );
        }
        return Scaffold(
          appBar: AppBar(),
          body: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(text: categoryName),
                SizedBox(
                  height: 20.h,
                ),
                Expanded(
                  child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, Routes.movieDetails,
                                arguments:
                                    CategoriesMoviesListCubit.get(context)
                                        .moviesList[index]
                                        .id
                                        .toString());
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 5,
                            ),
                            margin: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.grey[850],
                              borderRadius: BorderRadius.circular(5),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.white38,
                                  blurRadius: 10,
                                )
                              ],
                            ),
                            child: Row(
                              children: [
                                SizedBox(
                                  height: 150.h,
                                  child: CachedNetworkImage(
                                    imageUrl:
                                        "${Constants.baseImgUrl}${CategoriesMoviesListCubit.get(context).moviesList[index].posterPath}",
                                    placeholder: (context, url) => const Center(
                                      child: CircularProgressIndicator(
                                        color: AppColors.primary,
                                      ),
                                    ),
                                    errorWidget: (context, url, error) =>
                                        Container(
                                            color: Colors.white,
                                            child: const Center(
                                                child: Text(
                                              'image not found',
                                              style: TextStyle(
                                                  color: Colors.black),
                                            ))),
                                  ),
                                ),
                                SizedBox(
                                  width: 15.w,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                        width: 200.w,
                                        child: Text(
                                            CategoriesMoviesListCubit.get(
                                                        context)
                                                    .moviesList[index]
                                                    .title ??
                                                "",
                                            style: const TextStyle(
                                                fontSize: 20,
                                                color: Colors.white,
                                                fontWeight: FontWeight.w400))),
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                    SizedBox(
                                      width: 225.w,
                                      child: Text(
                                        CategoriesMoviesListCubit.get(context)
                                                .moviesList[index]
                                                .overview ??
                                            '',
                                        maxLines: 4,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 14.sp,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                    SizedBox(
                                      width: 225.w,
                                      child: Row(
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Icon(
                                                Icons.star,
                                                color: Colors.yellow[700],
                                              ),
                                              const SizedBox(width: 5),
                                              Text(
                                                CategoriesMoviesListCubit.get(
                                                        context)
                                                    .moviesList[index]
                                                    .voteAverage
                                                    .toString(),
                                                style: const TextStyle(
                                                    fontSize: 14.0,
                                                    color: Colors.amber),
                                              ),
                                            ],
                                          ),
                                          const Spacer(),
                                          Text(
                                            CategoriesMoviesListCubit.get(
                                                        context)
                                                    .moviesList[index]
                                                    .releaseDate
                                                    ?.split('-')
                                                    .first ??
                                                '',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14.sp,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        );
                      },
                      itemCount: CategoriesMoviesListCubit.get(context)
                          .moviesList
                          .length),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
