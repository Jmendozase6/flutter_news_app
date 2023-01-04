import 'package:flutter/material.dart';
import 'package:news_production_app/data/data_providers/data_providers.dart';
import 'package:news_production_app/data/models/models.dart';
import 'package:news_production_app/presentation/common_widgets/list_news.dart';
import 'package:news_production_app/presentation/screens/home_screen/widgets/list_categories.dart';
import 'package:news_production_app/presentation/screens/home_screen/widgets/search_bar.dart';
import 'package:provider/provider.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_production_app/presentation/screens/home_screen/widgets/custom_app_bar.dart';
import 'package:news_production_app/presentation/styles/styles.dart' as styles;

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, this.country});

  static const String routeName = '/home';
  final String? country;

  @override
  Widget build(BuildContext context) {
    final countryProvider = Provider.of<CountryProvider>(context);

    final List<Article> listNews = Provider.of<NewsProvider>(context).headlines;
    final List<Article> listNewsCategory =
        Provider.of<NewsProvider>(context).getArticlesSelectedCategory;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Appbar
                const CustomAppBar(),
                //Title & subtitle
                ScreenUtil().setVerticalSpacing(20),
                Text('Bienvenido', style: styles.getTitleStyle()),
                Text(
                  'Está viendo noticias de ${countryProvider.selectedCountry}.',
                  style: styles.getsubTitleStyle(),
                ),
                ScreenUtil().setVerticalSpacing(10),
                // Search Bar
                const SearchBar(),
                ScreenUtil().setVerticalSpacing(10),
                Text('Titulares', style: styles.getTitleStyle()),
                ScreenUtil().setVerticalSpacing(10),
                ListNews(listNews: listNews),
                ScreenUtil().setVerticalSpacing(20),
                const ListCategories(),
                ScreenUtil().setVerticalSpacing(20),
                ListNews(listNews: listNewsCategory),
                ScreenUtil().setVerticalSpacing(20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
