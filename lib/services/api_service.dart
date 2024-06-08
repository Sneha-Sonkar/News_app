import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/article.dart';

class ApiService {
  final String basUrl =
      "https://newsapi.org/v2/top-headlines?country=in&apiKey=e86096a87cb54283ae8b2f1c0f6c94f8";

  Future<List<Article>> getNews() async {
    final response = await http.get(Uri.parse(basUrl));

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);

      final List<dynamic> articlesJson = jsonResponse['articles'];
      return articlesJson
          .map((json) => Article.fromJson(json))
          .where((article) =>
              article.urlToImage != null && article.urlToImage!.isNotEmpty)
          .toList();
    } else {
      throw Exception("Failed to load articke");
    }
  }
}
