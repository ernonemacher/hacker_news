import 'package:flutter/material.dart';
import 'package:hacker_news_app/api/hackernews_api.dart';
import 'package:hacker_news_app/componentes/loading.dart';
import 'package:hacker_news_app/models/item.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class ItemCard extends StatelessWidget {
  final int index;
  final int id;

  ItemCard({this.index, this.id});

  Item item = Item(title: "DAsd", score: 123);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      child: Card(
        color: Color(0xffe7e7e2),
        child: Center(
          child: FutureBuilder(
            future: HackerNewsApi.getItemById(id),
            initialData: null,
            builder: (BuildContext context, AsyncSnapshot<Item> snapshot) {
              if (!snapshot.hasData) {
                return Loading();
              }

              Item item = snapshot.data;

              return ListTile(
                key: Key(item.id.toString()),
                leading: Text(
                  "${index + 1}.",
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xff5E5E5E),
                  ),
                ),
                title: Text(
                  item.title,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xff333333),
                  ),
                ),
                subtitle: _buildSubtitulo(item),
                onTap: () {
                  _openUrl(url: item.url);
                },
                onLongPress: () {
                  _shareNoZap(url: item.url);
                },
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildSubtitulo(Item item) {
    final dataPostagen = DateTime.fromMillisecondsSinceEpoch(item.time * 1000);

    Duration difference = DateTime.now().difference(dataPostagen);

    String tempo;

    if (difference.inMinutes < 60) {
      tempo = "${difference.inMinutes} minutos atrás";
    } else if (difference.inHours < 24) {
      tempo = "${difference.inHours} horas atrás";
    } else {
      tempo = "${difference.inDays} dias atrás";
    }

    return Text(
      "${item.score.toString()} pontos por ${item.by} $tempo",
      style: TextStyle(
        fontSize: 12,
        color: Color(0xff5E5E5E),
      ),
    );
  }

  void _openUrl({String url}) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      print("Não foi possivel abrir");
    }
  }

  void _shareNoZap({String url}) async {
    String text = "Olhe éssa notícia! $url";
    String zap = "whatsapp://send?text=${Uri.encodeQueryComponent(text)}";

    if (await canLaunch(zap)) {
      await launch(zap);
    } else {
      print("Não foi possivel abrir");
    }
  }
}
