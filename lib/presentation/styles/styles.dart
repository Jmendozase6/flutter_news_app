import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_production_app/core/constants/constants.dart' as constants;

TextStyle getTitleStyle({double? fontSize}) {
  return TextStyle(
    // color: ThemeColor.bodyText,
    fontWeight: FontWeight.w600,
    fontSize: fontSize ?? 27.sp,
    height: 1.5,
  );
}

TextStyle getsubTitleStyle({Color? color, FontWeight? weight}) {
  return TextStyle(
    fontWeight: weight ?? FontWeight.w400,
    fontSize: 16.sp,
    color: color ?? Colors.black,
  );
}

TextStyle getButtonTextStyle() {
  return TextStyle(
    // color: ThemeColor.bodyText,
    fontWeight: FontWeight.w400,
    fontSize: 20.sp,
    // height: 0.5.h,
  );
}

TextStyle getCountryTextStyle(Color color) {
  return TextStyle(
      // color: ThemeColor.bodyText,
      fontWeight: FontWeight.w400,
      fontSize: 18.sp,
      color: color
      // height: 0.5.h,
      );
}

TextStyle getNewTitleStyle() {
  return TextStyle(
    // color: ThemeColor.bodyText,
    fontWeight: FontWeight.w600,
    fontSize: 20.sp,
    // height: 0.5.h,
  );
}

ButtonStyle getRoundedButtonStyle() {
  return ElevatedButton.styleFrom(
    backgroundColor: constants.buttonColor,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(35.r),
    ),
  );
}

BoxDecoration roundedContainer({Color? color, double? radius}) {
  return BoxDecoration(
    color: color ?? constants.componentColor,
    borderRadius: BorderRadius.circular(radius ?? 20.r),
    border: Border.all(
      color: constants.titleColor.withOpacity(0.2),
    ),
  );
}
