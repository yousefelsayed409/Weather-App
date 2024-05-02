import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:weather_app/core/utils/app_colors.dart';

import 'package:weather_app/feature/home/presentation/views/widgets/home_view_body.dart';
import 'package:weather_app/feature/home/presentation/views/widgets/location_button.dart';

import '../../../../core/functions/get_morning_hour.dart';
import '../../../../core/widgets/app_bar_morning_widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.btncolor,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: AppMorningTextWidget(textt: '${getGreetings()} ❤️'),
        actions: const [
          LocationButton(),
        ],
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.light,
          statusBarColor: AppColors.transparent,
        ),
      ),
      body: const HomeViewBody(),
    );
  }
}
