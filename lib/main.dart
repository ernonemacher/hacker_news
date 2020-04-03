import 'package:flutter/material.dart';
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
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(),
        ),
      ),
      routes: _buildRoutes(),
    );
  }

  _buildRoutes() {
    return {
      "/": (_) => TopPage(),
      "last": (_) => LastPage(),
    };
  }
}
