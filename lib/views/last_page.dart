import 'package:flutter/material.dart';
import 'package:hacker_news_app/api/hackernews_api.dart';
import 'package:hacker_news_app/componentes/item_card.dart';
import 'package:hacker_news_app/componentes/loading.dart';

import 'home.dart';

class LastPage extends StatefulWidget {
  @override
  _LastPageState createState() => _LastPageState();
}

class _LastPageState extends State<LastPage> {
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
    final list = await HackerNewsApi.getLastStories();

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
                  "Últimas notícias",
                  style: TextStyle(fontSize: 22),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: _itens.length,
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
}
