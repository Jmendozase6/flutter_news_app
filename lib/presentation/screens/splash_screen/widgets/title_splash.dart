import 'package:flutter/material.dart';

import 'package:news_production_app/presentation/styles/styles.dart' as styles;

class TitleSplash extends StatelessWidget {
  const TitleSplash({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Choose A Country\nTo Start Reading',
            style: styles.getTitleStyle()),
        const Icon(Icons.flutter_dash, size: 50),
      ],
    );
  }
}
