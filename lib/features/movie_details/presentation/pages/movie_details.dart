import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../config/routes/app_route.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/constants.dart';
import '../../data/models/movie_details_model.dart';
import '../cubit/movie_details_cubit.dart';

class MovieDetails extends StatelessWidget {
  const MovieDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MovieDetailsCubit, MovieDetailsState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is MovieDetailsLoadingState) {
          return const Center(
            child: CircularProgressIndicator(
              color: AppColors.primary,
            ),
          );
        }
        return Scaffold(
          appBar: AppBar(),
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  height: 300.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: CachedNetworkImage(
                    placeholder: (context, url) => const Center(
                      child: CircularProgressIndicator(
                        color: AppColors.primary,
                      ),
                    ),
                    errorWidget: (context, url, error) => Container(
                        color: Colors.white,
                        child: const Center(
                            child: Text(
                          'image not found',
                          style: TextStyle(color: Colors.black),
                        ))),
                    imageUrl:
                        '${Constants.baseImgUrl}${MovieDetailsCubit.get(context).movieDetails?.backdropPath ?? ''}',
                    fit: BoxFit.fill,
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                        children: MovieDetailsCubit.get(context)
                                .movieDetails
                                ?.genres
                                ?.map((e) => Container(
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
                                      child: Text(
                                        e.name ?? '',
                                        style: const TextStyle(
                                            color: Colors.white),
                                      ),
                                    ))
                                .toList() ??
                            [])),
                Row(
                  children: [
                    SizedBox(
                      width: 250.w,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 15,
                        ),
                        child: Text(
                          MovieDetailsCubit.get(context).movieDetails?.title ??
                              '',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 22.sp,
                          ),
                        ),
                      ),
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () {
                        if (MovieDetailsCubit.get(context).isAdded == false) {
                          MovieDetailsCubit.get(context).addMovieToFireStore(MovieDetailsCubit.get(context).movieDetails as MovieDetailsModel);
                        } else {
                          MovieDetailsCubit.get(context).deleteMovieFromFireStore(
                              '${MovieDetailsCubit.get(context).movieDetails?.id.toString()}');
                        }
                        MovieDetailsCubit.get(context).changeWatchList();
                      },
                      icon: Icon(
                        MovieDetailsCubit.get(context).isAdded
                            ? Icons.check_box_rounded
                            : Icons.add_box_rounded,
                        color: Colors.white,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 5,
                      ),
                      margin: const EdgeInsets.all(15),
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
                          Icon(
                            Icons.star,
                            size: 16,
                            color: Colors.yellow[800],
                          ),
                          const SizedBox(width: 5),
                          Text(
                            MovieDetailsCubit.get(context)
                                    .movieDetails
                                    ?.voteAverage
                                    ?.toString()
                                    .substring(0, 3) ??
                                '',
                            style: const TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 15,
                  ),
                  child: Text(
                    MovieDetailsCubit.get(context).movieDetails?.overview ?? '',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14.sp,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 15,
                  ),
                  child: Text(
                    'Actors',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 22.sp,
                    ),
                  ),
                ),
                SizedBox(
                  height: 250.h,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: MovieDetailsCubit.get(context)
                              .actors
                              ?.cast
                              ?.map(
                                (e) => SizedBox(
                                  width: 200.w,
                                  child: GridTile(
                                    footer: Container(
                                      width: double.infinity,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 15, vertical: 10),
                                      color: Colors.black54,
                                      alignment: Alignment.bottomCenter,
                                      child: Text(
                                        '${e.name}',
                                        style: TextStyle(
                                          height: 1.3,
                                          fontSize: 16.sp,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    child: Container(
                                      margin: const EdgeInsets.only(left: 10),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      clipBehavior: Clip.antiAliasWithSaveLayer,
                                      child: CachedNetworkImage(
                                        placeholder: (context, url) =>
                                            const Center(
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
                                        imageUrl:
                                            '${Constants.baseImgUrl}${e.profilePath}',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                              )
                              .toList() ??
                          [],
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 15,
                  ),
                  child: Text(
                    'More Like This',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 22.sp,
                    ),
                  ),
                ),
                SizedBox(
                  height: 250.h,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: MovieDetailsCubit.get(context)
                              .moreLikeThis
                              .results
                              ?.map(
                                (e) => InkWell(
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, Routes.movieDetails,
                                        arguments: e.id.toString());
                                  },
                                  child: SizedBox(
                                    width: 200.w,
                                    child: GridTile(
                                      footer: Container(
                                        width: double.infinity,
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 15, vertical: 10),
                                        color: Colors.black54,
                                        alignment: Alignment.bottomCenter,
                                        child: Text(
                                          '${e.title}',
                                          style: TextStyle(
                                            height: 1.3,
                                            fontSize: 16.sp,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 2,
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      child: Container(
                                        margin: const EdgeInsets.only(left: 10),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        clipBehavior:
                                            Clip.antiAliasWithSaveLayer,
                                        child: CachedNetworkImage(
                                          placeholder: (context, url) =>
                                              const Center(
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
                                          imageUrl:
                                              '${Constants.baseImgUrl}${e.posterPath}',
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                              .toList() ??
                          [],
                    ),
                  ),
                ),
                SizedBox(
                  height: 100.h,
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
