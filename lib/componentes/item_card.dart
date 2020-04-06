import 'package:flutter/material.dart';
import 'package:hacker_news_app/models/information.dart';

class ItemCard extends StatelessWidget {
  final int index;
  final Information item;

  ItemCard({this.index, this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      child: Card(
        color: Color(0xffe7e7e2),
        child: Center(
          child: ListTile(
            key: Key(item.id.toString()),
            leading: Text(
              "${index + 1}.",
              style: TextStyle(
                fontSize: 16,
                color: Color(0xff5E5E5E),
              ),
            ),
            title: Text(
              item.titulo,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 16,
                color: Color(0xff333333),
              ),
            ),
            subtitle: Text(
              item.subtitulo,
              style: TextStyle(
                fontSize: 12,
                color: Color(0xff5E5E5E),
              ),
            ),
            onTap: () {},
          ),
        ),
      ),
    );
  }
}
