import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../cubit/home_cubit.dart';
import '../../widgets/coming_soon_movies.dart';
import '../../widgets/custom_text.dart';
import '../../widgets/movie_item.dart';

class MoviesScreen extends StatelessWidget {
  const MoviesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        return SafeArea(
            child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20.h,
              ),
              const CustomText(text: 'Coming Soon'),
              SizedBox(height: 20.h),
              SizedBox(
                height: 400.h,
                child: CarouselSlider(
                  options: CarouselOptions(
                    height: 400.h,
                    initialPage: 0,
                    enableInfiniteScroll: true,
                    reverse: false,
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 5),
                    autoPlayAnimationDuration: const Duration(seconds: 1),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    scrollDirection: Axis.horizontal,
                    viewportFraction: 1,
                  ),
                  items: HomeCubit.get(context).upcoming.map((i) {
                    return ComingSoonMovies(
                      movie: i,
                    );
                  }).toList(),
                ),
              ),
              const CustomText(
                text: 'Now Playing',
              ),
              SizedBox(height: 20.h),
              SizedBox(
                height: 550.h,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return MovieItem(
                      movie: HomeCubit.get(context).nowPlaying[index],
                    );
                  },
                  itemCount: HomeCubit.get(context).nowPlaying.length,
                ),
              ),
              const CustomText(
                text: 'Popular',
              ),
              SizedBox(height: 20.h),
              SizedBox(
                height: 550.h,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) => MovieItem(
                    movie: HomeCubit.get(context).popular[index],
                  ),
                  itemCount: HomeCubit.get(context).popular.length,
                ),
              ),
              const CustomText(
                text: 'Top Rated',
              ),
              SizedBox(height: 20.h),
              SizedBox(
                height: 550.h,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) => MovieItem(
                    movie: HomeCubit.get(context).topRated[index],
                  ),
                  itemCount: HomeCubit.get(context).topRated.length,
                ),
              )
            ],
          ),
        ));
      },
    );
  }
}
