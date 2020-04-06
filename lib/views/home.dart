import 'package:flutter/material.dart';
import 'package:hacker_news_app/componentes/hackernews_icon.dart';
import 'package:hacker_news_app/models/tipo.dart';

class Home extends StatelessWidget {
  final Widget child;

  Home({this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: HackernewsIcon(),
        title: Text("HackerNews"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.format_list_numbered),
            onPressed: () {
              Navigator.of(context).pushReplacementNamed(Tipo.TOP.toString());
            },
          ),
          IconButton(
            icon: Icon(Icons.new_releases),
            onPressed: () {
              Navigator.of(context).pushReplacementNamed(Tipo.LAST.toString());
            },
          )
        ],
      ),
      body: child,
    );
  }
}

