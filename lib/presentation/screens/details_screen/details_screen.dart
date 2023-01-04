import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_production_app/data/models/models.dart';
import 'package:news_production_app/presentation/screens/splash_screen/widgets/custom_bottom.dart';
import 'package:news_production_app/presentation/styles/styles.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  static const String routeName = '/details';

  @override
  Widget build(BuildContext context) {
    final article = ModalRoute.of(context)!.settings.arguments as Article;

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            _DetailImage(article: article),
            AlertDialog(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30.0))),
              insetPadding:
                  EdgeInsets.symmetric(horizontal: 20, vertical: 120.h),
              content: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    _TopDataCard(
                      source: article.source.name,
                      title: article.title,
                    ),
                    _ContentCard(article: article),
                  ],
                ),
              ),
            ),
            // _CustomContainerModal(),
          ],
        ),
      ),
    );
  }
}

class _ContentCard extends StatelessWidget {
  const _ContentCard({
    Key? key,
    required this.article,
  }) : super(key: key);

  final Article article;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 0.8.sh,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(article.description ?? '', textAlign: TextAlign.justify),
          ScreenUtil().setVerticalSpacing(20),
          Text(article.content ?? '', textAlign: TextAlign.justify),
          ScreenUtil().setVerticalSpacing(20),
          Text('${article.publishedAt}'),
          ScreenUtil().setVerticalSpacing(20),
          _FadeImage(urlToImage: article.urlToImage),
          ScreenUtil().setVerticalSpacing(20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomButton(
                function: () async {
                  await _launchUrl(article.url);
                },
                text: 'Ver noticia completa',
                width: 280.w,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<void> _launchUrl(String url) async {
    if (!await launchUrl(Uri.parse(url))) {
      throw 'Could not launch $url';
    }
  }
}

class _TopDataCard extends StatelessWidget {
  const _TopDataCard({
    Key? key,
    required this.source,
    required this.title,
  }) : super(key: key);

  final String source;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 35.h,
          width: 100.w,
          decoration: roundedContainer(color: Colors.amberAccent),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _BoxTitle(title: source),
            ],
          ),
        ),
        ScreenUtil().setVerticalSpacing(20),
        Text(
          title,
          style: getTitleStyle(fontSize: 15),
          textAlign: TextAlign.justify,
        ),
      ],
    );
  }
}

class _BoxTitle extends StatelessWidget {
  const _BoxTitle({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(fontSize: 10, overflow: TextOverflow.clip),
      textAlign: TextAlign.center,
    );
  }
}

class _DetailImage extends StatelessWidget {
  const _DetailImage({
    Key? key,
    required this.article,
  }) : super(key: key);

  final Article article;

  @override
  Widget build(BuildContext context) {
    return _TransparentImage(
      article: article,
      child: _FadeImage(urlToImage: article.urlToImage),
    );
  }
}

class _FadeImage extends StatelessWidget {
  const _FadeImage({
    Key? key,
    required this.urlToImage,
  }) : super(key: key);

  final String? urlToImage;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20.r),
      child: FadeInImage(
        placeholder: const AssetImage('assets/images/giphy.gif'),
        image: NetworkImage(urlToImage ?? ''),
        fit: BoxFit.cover,
        imageErrorBuilder: (_, __, ___) => const Image(
          image: AssetImage('assets/images/no-image.png'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _TransparentImage extends StatelessWidget {
  const _TransparentImage({
    Key? key,
    required this.article,
    required this.child,
  }) : super(key: key);

  final Article article;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
        shaderCallback: (Rect bounds) => const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.white, Colors.transparent],
            ).createShader(Rect.fromLTRB(0, 150, bounds.width, bounds.height)),
        blendMode: BlendMode.dstIn,
        child: child);
  }
}
