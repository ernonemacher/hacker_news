import 'package:flutter/material.dart';
import 'package:hacker_news_app/componentes/hackernews_icon.dart';
import 'package:hacker_news_app/componentes/item_card.dart';
import 'package:hacker_news_app/models/information.dart';
import 'package:hacker_news_app/models/tipo.dart';

import 'home.dart';

class LastPage extends StatefulWidget {
  @override
  _LastPageState createState() => _LastPageState();
}

class _LastPageState extends State<LastPage> {
  List<Information> _itens = [
    Information(titulo: "TITULO TESTE", subtitulo: "SUBTITULO TESTE"),
    Information(titulo: "TITULO TESTE", subtitulo: "SUBTITULO TESTE"),
    Information(titulo: "TITULO TESTE", subtitulo: "SUBTITULO TESTE"),
    Information(titulo: "TITULO TESTE", subtitulo: "SUBTITULO TESTE"),
    Information(titulo: "TITULO TESTE", subtitulo: "SUBTITULO TESTE"),
    Information(titulo: "TITULO TESTE", subtitulo: "SUBTITULO TESTE"),
    Information(titulo: "TITULO TESTE", subtitulo: "SUBTITULO TESTE"),
    Information(titulo: "TITULO TESTE", subtitulo: "SUBTITULO TESTE"),
    Information(titulo: "TITULO TESTE", subtitulo: "SUBTITULO TESTE"),
  ];

  @override
  Widget build(BuildContext context) {
    return Home(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              "Últimas notícias",
              style: TextStyle(fontSize: 22),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _itens.length,
                itemBuilder: (context, index) {
                  Information information = _itens[index];
                  return ItemCard(
                    index: index,
                    item: information,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
