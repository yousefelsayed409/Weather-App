import 'package:flutter/material.dart';
import 'package:weather_app/core/utils/app_constants.dart';
import 'package:weather_app/core/widgets/background_widget.dart';
import 'package:weather_app/feature/home/presentation/views/widgets/search_text_field.dart';

import '../../../../../core/widgets/animation_text.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(AppConstants.defaultPadding),
          child: Column(
            children: [
              const SearchTextField(),
              SizedBox(
                height: MediaQuery.of(context).size.height * .3,
              ),
              const MyAnimationTextWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
