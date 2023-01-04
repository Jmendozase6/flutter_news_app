import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_production_app/core/constants/constants.dart' as constants;

class CustomIcon extends StatelessWidget {
  const CustomIcon({super.key, required this.icon});

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.h,
      width: 60.h,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        border: Border.all(color: constants.subTitleColor.withOpacity(0.5)),
      ),
      child: Icon(icon, size: 20, color: constants.iconColor),
    );
  }
}
