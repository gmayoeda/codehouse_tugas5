import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:codehouse_tugas5/model/news.dart';
import 'package:codehouse_tugas5/server.dart';

class NewsRepository {
  String source = "techcrunch";

  Future<List<News>> getNews() async {
    http.Response value = await http.get(Uri.parse(Server.URL +
        "top-headlines?sources=${source}&apiKey=${Server.apikey}"));

    if (value.statusCode == 200) {
      Map<String, dynamic> response = json.decode(value.body);
      List<dynamic> list_data = response["articles"];
      List<News> list_news =
          list_data.map((dynamic e) => News.fromMap(e)).toList();
      return list_news;
    } else {
      throw Exception();
    }
  }
}
