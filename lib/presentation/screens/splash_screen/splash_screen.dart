import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_production_app/logic/user_preferences.dart';
import 'package:news_production_app/presentation/screens/screens.dart';

import 'package:news_production_app/presentation/screens/splash_screen/widgets/custom_bottom.dart';
import 'package:news_production_app/presentation/screens/splash_screen/widgets/list_countries.dart';
import 'package:news_production_app/core/constants/constants.dart' as constants;
import 'package:news_production_app/presentation/screens/splash_screen/widgets/title_splash.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  static const String routeName = '/splash';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ScreenUtil().setVerticalSpacing(10),
              const TitleSplash(),
              Divider(color: constants.buttonColor),
              ScreenUtil().setVerticalSpacing(10),
              ListCountries(),
              ScreenUtil().setVerticalSpacing(20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomButton(
                    function: () {
                      Navigator.pushNamedAndRemoveUntil(
                          context, HomeScreen.routeName, (route) => false);
                      UserPreferences.isShowedSplash = true;
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
