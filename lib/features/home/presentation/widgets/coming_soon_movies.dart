import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/routes/app_route.dart';
import '../../../../core/utils/app_colors.dart';
import '../../domain/entities/home_entity.dart';

class ComingSoonMovies extends StatelessWidget {
  final ResultsEntity movie;

  const ComingSoonMovies({
    super.key,
    required this.movie,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(onTap: () {
      Navigator.pushNamed(context, Routes.movieDetails,arguments: movie.id.toString());
    },
      child: Stack(children: [
        Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 10,
          ),
          height: 217,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: CachedNetworkImage(
            width: double.infinity,
            height: double.infinity,
            placeholder: (context, url) => const Center(
              child: CircularProgressIndicator(
                color: AppColors.primary,
              ),
            ),
            errorWidget: (context, url,
                error) =>
                Container(
                    color: Colors.white,
                    child: const Center(
                        child: Text(
                          'image not found',
                          style: TextStyle(
                              color: Colors.black),
                        ))),
            imageUrl: 'https://image.tmdb.org/t/p/original${movie.backdropPath}',
            fit: BoxFit.fill,
          ),
        ),
        Positioned(
          bottom: 50,
          child: SizedBox(
            height: 250,
            width: 200,
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              width: double.infinity,
              decoration: BoxDecoration(
                boxShadow: const [
                  BoxShadow(
                    color: Colors.white38,
                    blurRadius: 10,
                  )
                ],
                borderRadius: BorderRadius.circular(15),
              ),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: CachedNetworkImage(
                width: double.infinity,
                height: double.infinity,
                placeholder: (context, url) => const Center(
                  child: CircularProgressIndicator(
                    color: AppColors.primary,
                  ),
                ),
                errorWidget: (context, url,
                    error) =>
                    Container(
                        color: Colors.white,
                        child: const Center(
                            child: Text(
                              'image not found',
                              style: TextStyle(
                                  color: Colors.black),
                            ))),
                imageUrl:
                    'https://image.tmdb.org/t/p/original${movie.posterPath}',
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
        Positioned(
          top: 230,
          left: 200,
          child: Column(
            children: [
              SizedBox(
                width: 200.w,
                child: Text(
                  movie.title!,
                  style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 10.h),
              Text(
                movie.releaseDate?.split('-').first ?? '',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 14.sp,
                ),
              ),
              SizedBox(height: 10.h),
              Row(
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
                        movie.voteAverage.toString(),
                        style: const TextStyle(fontSize: 14.0,color: Colors.amber),
                      ),
                    ],
                  ),
                  SizedBox(width: 10.w,),
                ],
              ),

            ],
          ),
        ),
      ]),
    );
  }
}
