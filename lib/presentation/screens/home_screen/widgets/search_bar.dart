import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:news_production_app/core/constants/constants.dart';
import 'package:news_production_app/data/data_providers/data_providers.dart';
import 'package:news_production_app/presentation/screens/home_screen/widgets/search_controller.dart';
import 'package:news_production_app/presentation/screens/screens.dart';
import 'package:news_production_app/presentation/styles/styles.dart' as styles;
import 'package:provider/provider.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final searchProvider = Provider.of<SearchController>(context);
    final newsProvider = Provider.of<NewsProvider>(context);
    return Container(
      height: 60.h,
      width: 0.9.sw,
      decoration: styles.roundedContainer(),
      child: Row(
        children: [
          ScreenUtil().setHorizontalSpacing(20),
          Icon(
            FontAwesomeIcons.magnifyingGlass,
            color: subTitleColor,
          ),
          ScreenUtil().setHorizontalSpacing(20),
          SizedBox(
            height: 70.h,
            width: 0.7.sw,
            child: TextFormField(
              controller: searchProvider.searchController,
              decoration: InputDecoration(
                hintText: 'Buscar noticias...',
                hintStyle: styles.getsubTitleStyle(),
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
              ),
              onFieldSubmitted: (value) {
                searchProvider.searchValue = value;
                newsProvider.getArticlesByQuery(searchProvider.searchValue);
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (_, __, ___) => const SearchScreen(),
                    transitionDuration: const Duration(seconds: 1),
                    transitionsBuilder: (_, a, __, c) =>
                        FadeTransition(opacity: a, child: c),
                  ),
                );
              },
              keyboardType: TextInputType.name,
            ),
          )
        ],
      ),
    );
  }
}
