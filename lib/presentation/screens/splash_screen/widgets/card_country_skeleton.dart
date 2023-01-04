import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CardCountrySkeleton extends StatelessWidget {
  const CardCountrySkeleton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[100] ?? Colors.red,
      highlightColor: Colors.grey[300] ?? Colors.grey,
      child: const Card(
        shape: StadiumBorder(),
        child: ListTile(
          leading: Text(''),
          title: Text(
            '',
          ),
        ),
      ),
    );
  }
}
