import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import '../../../../config/routes/app_route.dart';
import '../cubit/splash_cubit.dart';
import '../widgets/animated_text.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? timer;

  @override
  void initState() {
    timer = Timer(const Duration(seconds: 6), () {
      Navigator.pushReplacementNamed(context, Routes.home);
    });
    super.initState();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SplashCubit, SplashState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.black,
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: TextButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, Routes.home);
                        },
                        child: const Text(
                          'Skip Intro',
                          style: TextStyle(color: Colors.white),
                        )),
                  ),
                  LottieBuilder.asset(
                    'assets/json/movie.json',
                    repeat: false,
                  ),
                  LottieBuilder.asset(
                    'assets/json/movies-title.json',
                    repeat: false,
                    onLoaded: (p0) {
                      SplashCubit.get(context).showText();
                    },
                  ),
                  const Spacer(),
                  Visibility(
                      visible: SplashCubit.get(context).isShow,
                      child: animatedText())
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
