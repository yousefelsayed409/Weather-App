import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/core/animations/page_fade_transition.dart';
import 'package:weather_app/core/animations/page_slide_transition.dart';
import 'package:weather_app/core/utils/app_strings.dart';
import 'package:weather_app/core/utils/service_locator.dart';
import 'package:weather_app/feature/home/data/models/weather_model/weather_model.dart';
import 'package:weather_app/feature/home/data/repository/home_repository_implementation.dart';
import 'package:weather_app/feature/home/presentation/cubits/weather_cubit/weather_cubit.dart';
import 'package:weather_app/feature/home/presentation/views/details_view.dart';
import 'package:weather_app/feature/home/presentation/views/home_view.dart';
import 'package:weather_app/feature/splash/presentation/views/splash_view.dart';

import '../../feature/on_boarding/presentation/views/on_boarding_view.dart';

class Routes {
  static const String splashView = '/';
  static const String onBoardingView = '/onBoarding_view';
  static const String onBoardingTowView = '/OnBoardingTowView';
  static const String homeView = '/home_view';
  static const String detailsView = '/details_view';
}

class ScreenArguments {
  final String? cityName;
  final String? latitude;
  final String? longitude;
  final WeatherModel? weatherModel;

  ScreenArguments({
    this.cityName,
    this.latitude,
    this.longitude,
    this.weatherModel,
  });
}

class AppRoutes {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashView:
        return MaterialPageRoute(
          builder: (_) => const SplashView(),
        );
      case Routes.onBoardingTowView:
        return MaterialPageRoute(
          builder: (_) => const OnBoardingView(),
        );

      case Routes.homeView:
        return PageFadeTransition(
          page: const HomeView(),
        );
      case Routes.detailsView:
        final arguments = settings.arguments as ScreenArguments?;
        return PageSlideTransition(
          direction: AxisDirection.left,
          page: BlocProvider(
            create: (context) => WeatherCubit(
              getIt.get<HomeRepositoryImplementation>(),
            ),
            child: DetailsView(
              cityName: arguments!.cityName ?? '',
              latitude: arguments.latitude ?? '',
              longitude: arguments.longitude ?? '',
              weatherModel: arguments.weatherModel ?? const WeatherModel(),
            ),
          ),
        );
    }
    return undefinedRoute();
  }

  static Route undefinedRoute() {
    return MaterialPageRoute(
      builder: ((context) => const Scaffold(
            body: Center(
              child: Text(AppStrings.noRouteFound),
            ),
          )),
    );
  }
}
