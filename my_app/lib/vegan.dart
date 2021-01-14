import 'package:flutter/material.dart';
import 'ingrlist.dart';

//A widget that displays if the ingredient list IS VEGAN
class Vegan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          title: new Text("Vegan"),
          actions: <Widget>[
            IconButton(
              icon: new Image.asset('images/coco.png'),
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context); //return to camera screen
              },
            )
          ],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Center(
                child: Text('This product is vegan!',
                    style: TextStyle(fontSize: 36.0),
                    textAlign: TextAlign.center)),
            SizedBox(height: 10),
            FlatButton(
              color: new Color(0xffc3d2d5),
              textColor: Colors.black,
              disabledColor: Colors.grey,
              disabledTextColor: Colors.black,
              padding: EdgeInsets.all(8.0),
              splashColor: Colors.blueAccent,
              onPressed: () {
                Navigator.push(
                  context,
                  new MaterialPageRoute(builder: (context) => new IngrList()),
                );
              },
              child: Text("See ingredient list",
                  style: TextStyle(fontSize: 20.0),
                  textAlign: TextAlign.center),
            )
          ],
        ));
  }
}
