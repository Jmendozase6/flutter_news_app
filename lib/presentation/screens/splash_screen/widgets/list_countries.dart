import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_production_app/data/models/models.dart' show Country;
import 'package:news_production_app/presentation/screens/splash_screen/widgets/card_country.dart';
import 'package:news_production_app/presentation/screens/splash_screen/widgets/card_country_skeleton.dart';

class ListCountries extends StatelessWidget {
  ListCountries({
    Key? key,
    this.height,
  }) : super(key: key);

  final List<Country> countries = Country.dataCountries;
  // final List<Country> countries = [];
  final double? height;

  @override
  Widget build(BuildContext context) {
    return countries.isEmpty
        ? SizedBox(
            height: height ?? 0.70.sh,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: 10,
              itemBuilder: (_, __) => const CardCountrySkeleton(),
            ),
          )
        : SizedBox(
            height: height ?? 0.70.sh,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: countries.length,
              itemBuilder: (_, int index) => CardCountry(
                country: countries[index],
              ),
            ),
          );
  }
}
