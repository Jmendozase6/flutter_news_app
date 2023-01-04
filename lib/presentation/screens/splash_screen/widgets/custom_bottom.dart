import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_production_app/presentation/styles/styles.dart' as styles;

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    this.width,
    this.text,
    this.function,
  }) : super(key: key);

  final double? width;
  final String? text;
  final Function()? function;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70.h,
      width: width ?? 390.w,
      child: ElevatedButton(
        onPressed: function,
        style: styles.getRoundedButtonStyle(),
        child: Text(text ?? 'Seleccionar', style: styles.getButtonTextStyle()),
      ),
    );
  }
}
