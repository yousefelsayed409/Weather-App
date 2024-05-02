import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/core/utils/app_colors.dart';

class MyAnimationTextWidget extends StatefulWidget {
  const MyAnimationTextWidget({super.key});

  @override
  _MyAnimationTextWidgetState createState() => _MyAnimationTextWidgetState();
}

class _MyAnimationTextWidgetState extends State<MyAnimationTextWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedTextKit(
        animatedTexts: [
          TypewriterAnimatedText(
            '📍 '
            'There is no weather start searching now 🔍',
            textAlign: TextAlign.center,
            speed: const Duration(milliseconds: 120),
            textStyle: TextStyle(
              color: AppColors.white,
              fontSize: 30.sp,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
        isRepeatingAnimation: true,
        repeatForever: true,
        displayFullTextOnTap: true,
        stopPauseOnTap: false,
      ),
    );
  }
}
