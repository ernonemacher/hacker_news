import 'package:flutter/material.dart';
import 'package:hacker_news_app/models/information.dart';

class TopPage extends StatefulWidget {
  @override
  _TopPageState createState() => _TopPageState();
}

class _TopPageState extends State<TopPage> {
  List<Information> _listaInf = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HackerNews"),
        actions: <Widget>[
          Container(
            child: Padding(
              padding: EdgeInsets.fromLTRB(10, 14, 7, 13),
              child: Text(
                "Y",
                style: TextStyle(color: Color(0xffFF6600), fontSize: 24),
              ),
            ),
            color: Colors.white,
          ),
          IconButton(
            icon: Icon(Icons.format_list_numbered),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.new_releases),
            onPressed: () {
              Navigator.of(context).pushNamed("last");
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: <Widget>[
            Text("Top 30 abril",style: TextStyle(fontSize: 22),),
//          ListView.separated(
//            padding:
//                const EdgeInsets.symmetric(vertical: 32.0, horizontal: 16.0),
//            itemCount: _listaInf.length,
//            itemBuilder: (context, index) {
//              return _buildInformation(index);
//            },
//            separatorBuilder: (context, index) {
//              return Divider();
//            },
//          ),
          ],
        ),
      ),
    );
  }

  Widget _buildInformation(int index) {
    Information information = _listaInf[index];

    return ListTile(
      key: Key(information.id.toString()),
      title: Text(
        information.titulo,
        style: Theme.of(context).textTheme.title,
      ),
      subtitle: Text(information.subtitulo),
      onTap: () {},
    );
  }
}
