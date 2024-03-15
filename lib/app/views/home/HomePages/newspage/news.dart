import 'package:flutter/material.dart';
import 'package:movie_api/app/utils/colors.dart';

import '../../../../models/article.dart';
import '../../../../services/news_api.dart';
import 'newscard.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  late Future<List<Article>> news;
  @override
  void initState() {
    super.initState();
    news = NewsService().getEntertainmentNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: AppColors.kBlackColor,
          title: const Text(
            'Trending News',
            style: TextStyle(
                fontWeight: FontWeight.bold, color: AppColors.kPrimary),
          ),
          centerTitle: true,
        ),
        backgroundColor: AppColors.kBlackColor,
        body: SafeArea(
            child: SingleChildScrollView(
          child: FutureBuilder<List<Article>>(
            future: news,
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(
                  child: Text(snapshot.hasError.toString()),
                );
              } else if (snapshot.hasData) {
                return NewsCard(snapshot: snapshot);
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
        )));
  }
}
