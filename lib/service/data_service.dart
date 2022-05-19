import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/model/article.dart';

String apiKey = '370038e9a0754f908736dfe556581e99';
String baseUrl = 'https://newsapi.org/v2/';

class News {
  Future<List<Article>?> getNews() async {
    String url = '$baseUrl/top-headlines?apiKey=$apiKey&country=id';
    return await _getNewsByUrl(url);
  }

  Future<List<Article>?> _getNewsByUrl(String url) async {
    List<Article> list;
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      var result = data['articles'] as List;
      list = result.map<Article>((json) => Article.fromJson(json)).toList();
      debugPrint(response.body);
      return list;
    } else {
      throw Exception('Cannot get data');
    }
  }

  Future<List<Article>?> getNewsByCategory(String category) async {
    String url =
        '$baseUrl/top-headlines?apiKey=$apiKey&country=id&category=$category';
    return await _getNewsByUrl(url);
  }
}
