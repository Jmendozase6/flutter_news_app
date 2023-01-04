import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_production_app/core/constants/constants.dart';
import 'package:news_production_app/data/data_providers/data_providers.dart';
import 'package:news_production_app/presentation/screens/home_screen/widgets/list_filters.dart';
import 'package:news_production_app/presentation/screens/screens.dart';
import 'package:provider/provider.dart';

import 'package:news_production_app/data/models/article.dart';
import 'package:news_production_app/presentation/styles/styles.dart' as styles;

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  static const String routeName = '/search';

  @override
  Widget build(BuildContext context) {
    final List<Article> news = Provider.of<NewsProvider>(context).byQuery;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                Text('Resultados', style: styles.getTitleStyle()),
                Text('De su búsqueda', style: styles.getsubTitleStyle()),
                const ListFilters(),
                ScreenUtil().setVerticalSpacing(20),
                (news.isEmpty)
                    ? const Center(child: CupertinoActivityIndicator())
                    : SizedBox(
                        height: 0.8.sh,
                        child: ListView.separated(
                          physics: const BouncingScrollPhysics(),
                          itemCount: news.length,
                          itemBuilder: (_, index) =>
                              _CardResult(article: news[index]),
                          separatorBuilder: (_, __) => const Divider(),
                        ),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _CardResult extends StatelessWidget {
  const _CardResult({
    Key? key,
    required this.article,
  }) : super(key: key);

  final Article article;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () {
          Navigator.pushNamed(context, DetailsScreen.routeName,
              arguments: article);
        },
        tileColor: componentColor,
        leading: FadeInImage(
          placeholder: const AssetImage('assets/images/giphy.gif'),
          image: NetworkImage(article.urlToImage ?? ''),
          fit: BoxFit.cover,
          imageErrorBuilder: (_, __, ___) => const Image(
            image: AssetImage('assets/images/no-image.png'),
          ),
        ),
        title: Text(
          article.title,
          style: styles.getTitleStyle(fontSize: 13),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle:
            Text('${article.publishedAt}', style: styles.getsubTitleStyle()),
      ),
    );
  }
}
