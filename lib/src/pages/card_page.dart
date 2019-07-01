import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("cards")),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
        children: _createList(), //<Widget>[_cardTipo1(), _cardTipo2()],
      ),
    );
  }

  List<Widget> _createList() {
    var list = <Widget>[];
    list.add(_cardTipo1());
    for (var i = 0; i < 200; i++) {
      list.add(_cardTipo2());
      //list.add(_cardTipo3('assets/a.jpeg'));
      //list.add(_cardTipo3('assets/b.jpeg'));
      //list.add(_cardTipo3('assets/c.jpeg'));
      //list.add(_cardTipo3('assets/c.mp4'));
    }
    return list;
  }

  Widget _cardTipo1() {
    return Card(
      elevation: 2.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      child: Column(
        children: <Widget>[
          ListTile(
            leading: Icon(
              Icons.photo_album,
              color: Colors.blue,
            ),
            title: Text("Titulo de la card"),
            subtitle: Text("lorem"),
          ),
          SizedBox(
            height: 30.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              FlatButton(
                child: Text("Cancelar"),
                onPressed: () {},
              ),
              FlatButton(
                child: Text("ok"),
                onPressed: () {},
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _cardTipo2() {
    final card = Container(
      //clipBehavior: Clip.antiAlias,
      child: Column(
        children: <Widget>[
          FadeInImage(
            image: NetworkImage(
                'https://flickrtheblog.files.wordpress.com/2017/11/10285894466_b72616f2c1_b.jpg?w=1024&h=423&crop=1'),
            placeholder: AssetImage('assets/jar-loading.gif'),
            fadeInDuration: Duration(milliseconds: 1500),
            fadeOutDuration: Duration(milliseconds: 1500),
            height: 300.0,
            fit: BoxFit.cover,
          ),
          /* 
          Image(
            image: NetworkImage('https://flickrtheblog.files.wordpress.com/2017/11/10285894466_b72616f2c1_b.jpg?w=1024&h=423&crop=1')),
          */
          Container(
            child: Text('No have text'),
            padding: EdgeInsets.symmetric(vertical: 20.0),
          )
        ],
      ),
    );
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: Colors.white,
        boxShadow: <BoxShadow>[
          BoxShadow(
              color: Colors.black26,
              blurRadius: 10.0,
              spreadRadius: 1.0,
              offset: Offset(-1.0, 1.0))
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: card,
      ),
    );
  }

  Widget _cardTipo3(var img) {
    final card = Container(
      //clipBehavior: Clip.antiAlias,
      child: Column(
        children: <Widget>[
          Image(image: AssetImage(img)),
          Container(
            child: Text('No have text'),
            padding: EdgeInsets.symmetric(vertical: 20.0),
          )
        ],
      ),
    );
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: Colors.white,
        boxShadow: <BoxShadow>[
          BoxShadow(
              color: Colors.black26,
              blurRadius: 10.0,
              spreadRadius: 1.0,
              offset: Offset(-1.0, 1.0))
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: card,
      ),
    );
  }
}
