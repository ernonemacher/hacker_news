import 'package:flutter/material.dart';
import 'package:hacker_news_app/api/hackernews_api.dart';
import 'package:hacker_news_app/componentes/hackernews_icon.dart';
import 'package:hacker_news_app/componentes/item_card.dart';
import 'package:hacker_news_app/componentes/loading.dart';
import 'package:hacker_news_app/models/item.dart';
import 'package:hacker_news_app/models/tipo.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

import 'home.dart';

class TopPage extends StatefulWidget {
  @override
  _TopPageState createState() => _TopPageState();
}

class _TopPageState extends State<TopPage> {
  List<int> _itens = [];
  bool _isloading = true;
  int page = 1;
  final itemPorPagina = 10;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Future.delayed(Duration.zero, _getList);
  }

  Future<void> _getList() async {
    final list = await HackerNewsApi.getTopStories();

    setState(() {
      _itens = list;
      _isloading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Home(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Builder(
          builder: (context) {
            if (_isloading) {
              return Loading();
            }
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(
                  "Top ${_dateFormat()}",
                  style: TextStyle(fontSize: 22),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: page * itemPorPagina,
                    itemBuilder: (context, index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          ItemCard(
                            index: index,
                            id: _itens[index],
                          ),
                          if (index == page * itemPorPagina - 1)
                            RaisedButton(
                              onPressed: () {
                                setState(() {
                                  page++;
                                });
                              },
                              child: Text(
                                "Carregar mais",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6.0),
                              ),
                              color: Color(0xffFF6600),
                            ),
                        ],
                      );
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  String _dateFormat() {
    return DateFormat("d MMMM").format(DateTime.now());
  }
}
