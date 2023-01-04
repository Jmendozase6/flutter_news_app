import 'package:flutter/material.dart';
import 'package:news_production_app/data/data_providers/filter_provider.dart';
import 'package:news_production_app/data/models/sort.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_production_app/core/constants/constants.dart' as constants;
import 'package:news_production_app/data/data_providers/data_providers.dart';
import 'package:news_production_app/presentation/styles/styles.dart' as styles;

class ListFilters extends StatelessWidget {
  const ListFilters({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Sort> categories = Provider.of<NewsProvider>(context).filters;

    return SizedBox(
      height: 50.h,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (_, int index) => _FilterIcon(categories[index]),
      ),
    );
  }
}

class _FilterIcon extends StatelessWidget {
  const _FilterIcon(this.sort);

  final Sort sort;

  @override
  Widget build(BuildContext context) {
    final filterProvider = Provider.of<FilterProvider>(context);
    final newsProvider = Provider.of<NewsProvider>(context);
    final bool isSelected = filterProvider.selectedFilter == sort.name;

    return GestureDetector(
      onTap: () {
        newsProvider.selectedFilter = sort.name;
        filterProvider.selectedFilter = sort.name;
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
                      Icon(sort.icon, color: constants.iconColor, size: 15),
                      ScreenUtil().setHorizontalSpacing(20),
                    ],
                  ),
            Text(
              '${sort.name[0].toUpperCase()}${sort.name.substring(1)}',
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
