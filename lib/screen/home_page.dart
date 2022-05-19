import 'package:flutter/material.dart';
import 'package:news_app/model/article.dart';
import 'package:news_app/screen/news_page.dart';
import 'package:news_app/service/data_service.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    News news = News();
    return Scaffold(
      appBar: AppBar(
        leading: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            image: const DecorationImage(
              image: NetworkImage(
                  'https://lh3.googleusercontent.com/a-/AOh14GiynnTNElGq2aSAge5tmv_r6lz3q127ujlJ2k0j=s389-p-rw-no'),
            ),
          ),
          width: 10,
          margin: const EdgeInsets.all(5),
        ),
        title: const Text(
          'Good Morning',
          style: TextStyle(fontSize: 20, color: Colors.black),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.bookmark),
            onPressed: () {},
            color: Colors.blue,
          ),
        ],
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: FutureBuilder(
        future: news.getNews(),
        builder: (context, snapshot) {
          return snapshot.hasData
              ? NewsPage(snapshot.data as List<Article>)
              : const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
