import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_production_app/core/constants/constants.dart';
import 'package:news_production_app/data/models/models.dart';
import 'package:news_production_app/presentation/screens/details_screen/details_screen.dart';
import 'package:news_production_app/presentation/styles/styles.dart' as styles;

class ListNews extends StatelessWidget {
  const ListNews({super.key, required this.listNews});

  final List<Article> listNews;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300.h,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: listNews.length,
        itemBuilder: (_, index) => CardArticle(
          article: listNews[index],
        ),
      ),
    );
  }
}

class CardArticle extends StatelessWidget {
  const CardArticle({super.key, required this.article});

  final Article article;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, DetailsScreen.routeName,
            arguments: article);
      },
      child: Container(
        width: 320.w,
        margin: const EdgeInsets.only(right: 10),
        decoration: styles.roundedContainer(),
        child: Stack(
          children: [
            _CardImage(urlToImage: article.urlToImage ?? ''),
            _CardAuthor(autor: article.author),
            _CardTitle(title: article.title),
            _CardGeneralInfo(
                name: article.source.name, publishedAt: article.publishedAt),
          ],
        ),
      ),
    );
  }
}

class _CardGeneralInfo extends StatelessWidget {
  const _CardGeneralInfo({
    Key? key,
    required this.name,
    required this.publishedAt,
  }) : super(key: key);

  final String name;
  final DateTime publishedAt;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 260.h,
      left: 10.w,
      right: 10.w,
      child: SizedBox(
        width: 260.w,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ScreenUtil().setHorizontalSpacing(10),
            SizedBox(
              width: 115.w,
              child: Text(
                name,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            ScreenUtil().setHorizontalSpacing(20),
            SizedBox(
              width: 115.w,
              child: Text(
                '$publishedAt',
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CardTitle extends StatelessWidget {
  const _CardTitle({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 195.h,
      left: 20.w,
      child: SizedBox(
        width: 240.w,
        child: Text(
          title,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: styles.getNewTitleStyle(),
        ),
      ),
    );
  }
}

class _CardAuthor extends StatelessWidget {
  const _CardAuthor({
    Key? key,
    this.autor,
  }) : super(key: key);

  final String? autor;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 170.h,
      left: 20.w,
      child: SizedBox(
        width: 260.w,
        child: Text(
          autor ?? 'NO AUTHOR',
          style: styles.getsubTitleStyle(
            color: titleColor.withOpacity(0.5),
            weight: FontWeight.w600,
          ),
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}

class _CardImage extends StatelessWidget {
  const _CardImage({
    Key? key,
    required this.urlToImage,
  }) : super(key: key);

  final String urlToImage;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 10.h,
      right: 10.w,
      left: 10.w,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.r),
        child: SizedBox(
          height: 150.h,
          width: 300.w,
          child: FadeInImage(
            placeholder: const AssetImage('assets/images/giphy.gif'),
            image: NetworkImage(urlToImage),
            fit: BoxFit.cover,
            imageErrorBuilder: (_, __, ___) => const Image(
              image: AssetImage('assets/images/no-image.png'),
            ),
          ),
        ),
      ),
    );
  }
}
