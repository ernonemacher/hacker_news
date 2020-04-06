import 'package:flutter/material.dart';
import 'package:hacker_news_app/models/tipo.dart';
import 'package:hacker_news_app/views/top_page.dart';
import 'package:hacker_news_app/views/last_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Recipes",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xffFF6600),
        accentColor: Color(0xffFF6600),
        backgroundColor: Color(0xffF6F6EF)
      ),
      routes: _buildRoutes(),
    );
  }

  _buildRoutes() {
    return {
      "/" : (_) => TopPage(),
      Tipo.TOP.toString(): (_) => TopPage(),
      Tipo.LAST.toString(): (_) => LastPage(),
    };
  }
}
