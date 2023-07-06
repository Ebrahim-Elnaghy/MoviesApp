import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;

  const CustomText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return  Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                text,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                  shadows: [
                    Shadow(
                      color: Colors.grey,
                      blurRadius: 20,
                      offset: Offset(2, 2),
                    ),
                  ],
                ),
              ),
            );
  }
}