import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../config/routes/app_route.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../cubit/home_cubit.dart';
import '../../widgets/custom_text.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                const CustomText(text: 'Search for a Movie'),
                SizedBox(
                  height: 20.h,
                ),
                TextField(
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: AppColors.onPrimary,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide.none),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide.none),
                      hintText: 'example : shawshank redemption',
                      prefixIcon: const Icon(Icons.search),
                      prefixIconColor: AppColors.primary),
                  onChanged: (keyword) {
                    HomeCubit.get(context).search(keyword);
                  },
                  onSubmitted: (keyword) {
                    HomeCubit.get(context).search(keyword);
                  },
                ),
                SizedBox(
                  height: 10.h,
                ),
                if (state is HomeLoadingState)
                  const LinearProgressIndicator(
                    color: AppColors.primary,
                  ),
                Expanded(
                    child: ListView.builder(
                  itemBuilder: (context, index) => ListTile(
                    contentPadding: const EdgeInsets.all(8),
                    onTap: () {
                      Navigator.pushNamed(context, Routes.movieDetails,arguments: HomeCubit.get(context).searchList[index].id.toString());
                    },
                    title: Text(
                      HomeCubit.get(context).searchList[index].title!,
                      style: const TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      HomeCubit.get(context)
                          .searchList[index]
                          .releaseDate!
                          .split('-')
                          .first,
                      style: const TextStyle(color: Colors.white60),
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.yellow[700],
                          size: 16,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          HomeCubit.get(context)
                              .searchList[index]
                              .voteAverage
                              .toString()
                              .substring(0, 3),
                          style: const TextStyle(color: Colors.amber),
                        ),
                      ],
                    ),
                    leading: HomeCubit.get(context)
                                .searchList[index]
                                .posterPath ==
                            null
                        ? Container(
                            color: Colors.white,
                            padding: const EdgeInsets.symmetric(
                                vertical: 15, horizontal: 3),
                            child: const Text(
                              'No Image',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 8),
                            ))
                        : Image.network(
                            'https://image.tmdb.org/t/p/original${HomeCubit.get(context).searchList[index].posterPath}'),
                  ),
                  itemCount: HomeCubit.get(context).searchList.length,
                  physics: const BouncingScrollPhysics(),
                ))
              ],
            ),
          ),
        );
      },
    );
  }
}
