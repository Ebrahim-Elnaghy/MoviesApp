import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/utils/app_colors.dart';

Widget animatedText() {
  return DefaultTextStyle(
    style: GoogleFonts.roboto(
      fontSize: 20,
      color: Colors.white,
      shadows: [
        const Shadow(
          blurRadius: 7,
          color: AppColors.primary,
          offset: Offset(0, 0),
        )
      ],
    ),
    child: AnimatedTextKit(
      animatedTexts: [
        FlickerAnimatedText('By Ebrahim Elnaghy'),
      ],
    ),
  );
}
