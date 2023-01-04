import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_production_app/core/constants/constants.dart' as constants;
import 'package:news_production_app/data/data_providers/data_providers.dart';
import 'package:news_production_app/data/models/category.dart';
import 'package:news_production_app/presentation/styles/styles.dart' as styles;

class ListCategories extends StatelessWidget {
  const ListCategories({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Category> categories =
        Provider.of<NewsProvider>(context).categories;
    return SizedBox(
      height: 50.h,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (_, int index) => _CategoryIcon(categories[index]),
      ),
    );
  }
}

class _CategoryIcon extends StatelessWidget {
  const _CategoryIcon(this.category);

  final Category category;

  @override
  Widget build(BuildContext context) {
    final categoryProvider = Provider.of<CategoryProvider>(context);
    final newsProvider = Provider.of<NewsProvider>(context);
    final bool isSelected = categoryProvider.selectecCategory == category.name;

    return GestureDetector(
      onTap: () {
        newsProvider.selectedCategory = category.name;
        categoryProvider.selectecCategory = category.name;
      },
      child: Container(
        height: 70.h,
        width: 180.w,
        margin: const EdgeInsets.only(right: 10),
        decoration: isSelected
            ? styles.roundedContainer(
                radius: 30.r, color: constants.buttonColor)
            : styles.roundedContainer(radius: 30.r),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            isSelected
                ? Container()
                : Row(
                    children: [
                      Icon(category.icon, color: constants.iconColor, size: 15),
                      ScreenUtil().setHorizontalSpacing(20),
                    ],
                  ),
            Text(
              '${category.name[0].toUpperCase()}${category.name.substring(1)}',
              style: isSelected
                  ? styles.getsubTitleStyle(color: Colors.white)
                  : styles.getsubTitleStyle(),
            ),
          ],
        ),
      ),
    );
  }
}
