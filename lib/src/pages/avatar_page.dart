import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Avatar Page'),
          actions: <Widget>[
            Container(
              padding: EdgeInsets.all(5.0),
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://pbs.twimg.com/profile_images/1018943227791982592/URnaMrya.jpg'),
                radius: 25.0,
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: 10.0),
              child: CircleAvatar(
                child: Text('SL'),
                backgroundColor: Colors.brown,
              ),
            )
          ],
        ),
        body: Center(
            child: FadeInImage(
          image: NetworkImage(
              'https://flickrtheblog.files.wordpress.com/2017/11/10285894466_b72616f2c1_b.jpg?w=1024&h=423&crop=1'),
          placeholder: AssetImage('assets/jar-loading.gif'),
          fadeInDuration: Duration(milliseconds: 1500),
          fadeOutDuration: Duration(milliseconds: 1500),
          height: 200.0,
          fit: BoxFit.cover,
        )));
  }
}
