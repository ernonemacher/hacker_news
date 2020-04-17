import 'dart:convert';

import 'package:hacker_news_app/models/item.dart';
import "package:http/http.dart" as http;

class HackerNewsApi {
  static const String BASE_API = "https://hacker-news.firebaseio.com/v0/";

  static Future<List<int>> getTopStories() async {
    String url = BASE_API + "topstories.json";
    try {
      http.Response response = await http.get(url);

      print("statuscode = ${response.statusCode}, body = ${response.body}");

      if (response.statusCode == 200) {
        String body = response.body;

        final decoded = json.decode(body);
        return List<int>.from(decoded);
      }
    } catch (exception) {
      print(exception.toString());
    }
    return [];
  }

  static Future<List<int>> getLastStories() async {
    String url = BASE_API + "newstories.json";
    try {
      http.Response response = await http.get(url);

      //   print("statuscode = ${response.statusCode}, body = ${response.body}");

      if (response.statusCode == 200) {
        String body = response.body;

        final decoded = json.decode(body);
        return List<int>.from(decoded);
      }
    } catch (exception) {
      print(exception.toString());
    }
    return [];
  }

  static Future<Item> getItemById(int id) async {
    String url = BASE_API + "item/${id}.json";

    http.Response response = await http.get(url);

    try {
      if (response.statusCode == 200) {
        final decoded = json.decode(response.body);
        return Item.fromJson(decoded);
      }
    } catch (exception) {
      print(exception.toString());
    }
    return null;
  }
}
