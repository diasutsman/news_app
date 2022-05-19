import 'package:flutter/material.dart';
import 'package:news_app/model/article.dart';
import 'package:news_app/utils/utils.dart';
import 'package:news_app/widget/carousel_widget.dart';
import 'package:news_app/widget/tab_menu.dart';

class NewsPage extends StatefulWidget {
  final List<Article> articles;

  const NewsPage(this.articles, {Key? key}) : super(key: key);

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              "Breaking News",
              style: titleHome,
            ),
          ),
          CarouselWidget(widget.articles),
          TabBarMenu(widget.articles)
        ],
      ),
    );
  }
}
