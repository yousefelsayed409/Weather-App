import 'package:flutter/material.dart';

import 'package:shimmer/shimmer.dart';

import '../utils/app_colors.dart';
import '../utils/app_styles.dart';

class AppMorningTextWidget extends StatelessWidget {
  const AppMorningTextWidget(
      {super.key, required this.textt, this.baseColor, this.highlightColor});
  final String textt;
  final Color? baseColor;
  final Color? highlightColor;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      period: const Duration(seconds: 2),
      baseColor: baseColor ?? AppColors.iconinbtncolor,
      highlightColor: highlightColor ?? AppColors.white,
      child: Text(
        textt,
        style: AppStyles.textStyle25.copyWith(
          color: AppColors.white,
        ),
      ),
    );
  }
}
