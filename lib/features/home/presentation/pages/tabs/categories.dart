import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../config/routes/app_route.dart';
import '../../cubit/home_cubit.dart';
import '../../widgets/custom_text.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

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
                const CustomText(text: 'Browse Category'),
                SizedBox(
                  height: 20.h,
                ),
                SizedBox(
                  height: 10.h,
                ),
                Expanded(
                    child: GridView.builder(
                      physics: const BouncingScrollPhysics(),
                  itemCount: HomeCubit.get(context).categories.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemBuilder: (BuildContext context, int index) => InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, Routes.moviesList,
                          arguments: HomeCubit.get(context)
                              .categories[index]);
                    },
                    child: GridTile(
                      footer: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 10),
                        color: Colors.black54,
                        alignment: Alignment.bottomCenter,
                        child: Text(
                          '${HomeCubit.get(context).categories[index].name}',
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
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 5,
                        ),
                        margin: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.grey[850],
                          image: const DecorationImage(
                              image: AssetImage(
                                'assets/images/categories.jpg',
                              ),
                              fit: BoxFit.fill),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.white38,
                              blurRadius: 10,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ))
              ],
            ),
          ),
        );
      },
    );
  }
}
