import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:news_production_app/presentation/screens/splash_screen/widgets/custom_bottom.dart';
import 'package:news_production_app/presentation/styles/styles.dart' as styles;

class MaintenanceScreen extends StatelessWidget {
  const MaintenanceScreen({super.key});

  static const String routeName = '/maintenance';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20.w),
              child: SvgPicture.asset('assets/images/maintenance_error.svg'),
            ),
            Text(
              'Oops!',
              style: styles.getTitleStyle(),
            ),
            ScreenUtil().setVerticalSpacing(20),
            Text(
              'Ahora nos encontramos en mantenimiento\nPor favor, vuelva más tarde.',
              style: styles.getsubTitleStyle(),
              textAlign: TextAlign.center,
            ),
            ScreenUtil().setVerticalSpacing(30),
            CustomButton(
              text: 'Cerrar',
              width: 0.7.sw,
              function: () => exit(0),
            ),
          ],
        ),
      ),
    );
  }
}
