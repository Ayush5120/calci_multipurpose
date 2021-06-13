import 'package:flutter/material.dart';

class CategoryBox extends StatelessWidget {
  CategoryBox(
      {@required this.pic,
      @required this.text,
      @required this.rang,
      this.action});

  final IconData pic;
  final String text;
  final Color rang;
  final Function action;

  //Color(0x2266c194)
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Material(
        color: Color(0xFF0A0E21),
        child: InkWell(
          splashColor: rang,
          borderRadius: BorderRadius.circular(50.0),
          onTap: () {
            action();
          },
          child: Container(
              width: 150,
              height: 200,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(50.0),
                color: Colors.pink,
              ),
              margin: EdgeInsets.all(10.0),
              padding: EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 10,),
                  Icon(
                    pic,
                    color: Colors.white60,
                    size: 70.0,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    text,
                    style: TextStyle(fontSize: 30.0, color: Colors.white),
                  )
                ],
              )),
        ),
      ),
    );
  }
}
