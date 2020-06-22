import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'article.dart';


class News{
  List<Article> news = [];
  String headline = "everything";
  Future<void> getNews () async {
    String url = "http://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=27bd5ef873fc46c094f992b742d24a0d";
    var response = await http.get(Uri.decodeFull(url));

    var jsonData = jsonDecode(response.body);

    if(jsonData['status']=='ok'){
      jsonData['articles'].forEach((e){
        if(e['urlToImage'] != null){

          Article article = Article(
          title: e['title'],
          author: e['author'],
          description: e['description'],
          urlToImage: e['urlToImage'],
          publishedAt: DateTime.parse(e['publishedAt']),
          content: e['content']
        );
        news.add(article);
        }
      });
    }
  }
}