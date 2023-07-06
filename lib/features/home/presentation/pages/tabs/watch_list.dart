import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../config/routes/app_route.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/constants.dart';
import '../../cubit/home_cubit.dart';
import '../../widgets/custom_text.dart';

class WatchlistScreen extends StatelessWidget {
  const WatchlistScreen({super.key});

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
                const CustomText(text: 'Watch List'),
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
                                arguments: HomeCubit.get(context)
                                    .watchList[index]
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
                                    "${Constants.baseImgUrl}${HomeCubit.get(context).watchList[index].posterPath}",
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
                                            HomeCubit.get(context)
                                                    .watchList[index]
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
                                        HomeCubit.get(context)
                                                .watchList[index]
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
                                                HomeCubit.get(context)
                                                    .watchList[index]
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
                                            HomeCubit.get(context)
                                                    .watchList[index]
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
                      itemCount: HomeCubit.get(context).watchList.length),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
