import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class GridWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Container(
          padding: EdgeInsets.all(20),
          color: Colors.purple,
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      WordPair.random().asPascalCase,
                      textDirection: TextDirection.ltr,
                      style: TextStyle(
                          color: Colors.white,
                          decoration: TextDecoration.none,
                          fontSize: 20.0,
                          fontFamily: 'Ruge Boogie',
                          fontWeight: FontWeight.w300,
                          fontStyle: FontStyle.italic),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      WordPair.random().asPascalCase,
                      textDirection: TextDirection.ltr,
                      style: TextStyle(
                          color: Colors.white,
                          decoration: TextDecoration.none,
                          fontSize: 20.0,
                          fontFamily: 'Ruge Boogie',
                          fontWeight: FontWeight.w300,
                          fontStyle: FontStyle.italic),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      WordPair.random().asPascalCase,
                      textDirection: TextDirection.ltr,
                      style: TextStyle(
                          color: Colors.white,
                          decoration: TextDecoration.none,
                          fontSize: 20.0,
                          fontFamily: 'Ruge Boogie',
                          fontWeight: FontWeight.w300,
                          fontStyle: FontStyle.italic),
                    ),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      WordPair.random().asPascalCase,
                      textDirection: TextDirection.ltr,
                      style: TextStyle(
                          color: Colors.white,
                          decoration: TextDecoration.none,
                          fontSize: 20.0,
                          fontFamily: 'Ruge Boogie',
                          fontWeight: FontWeight.w300,
                          fontStyle: FontStyle.italic),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      WordPair.random().asPascalCase,
                      textDirection: TextDirection.ltr,
                      style: TextStyle(
                          color: Colors.white,
                          decoration: TextDecoration.none,
                          fontSize: 20.0,
                          fontFamily: 'Ruge Boogie',
                          fontWeight: FontWeight.w300,
                          fontStyle: FontStyle.italic),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      WordPair.random().asPascalCase,
                      textDirection: TextDirection.ltr,
                      style: TextStyle(
                          color: Colors.white,
                          decoration: TextDecoration.none,
                          fontSize: 20.0,
                          fontFamily: 'Ruge Boogie',
                          fontWeight: FontWeight.w300,
                          fontStyle: FontStyle.italic),
                    ),
                  ),
                ],
              ),
              Row(
                children: <Widget>[Expanded(child: ImageWidget())],
              )
            ],
          )),
    );
  }
}

class ImageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    AssetImage assetImage = AssetImage(
        'images/macos-mojave-1920x1080-night-dunes-wwdc-2018-4k-18883.jpg');
    Image img = Image(image: assetImage, fit: BoxFit.cover);
    return Container(child: img);
  }
}
