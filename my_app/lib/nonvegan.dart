import 'package:flutter/material.dart';
import 'ingrlist.dart';

//A widget that displays if the ingredient list is NOT vegan
class NonVegan extends StatelessWidget {
  final List<String> ingredient;

  NonVegan({Key key, @required this.ingredient}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          title: new Text("Not vegan"),
          actions: <Widget>[
            IconButton(
              icon: new Image.asset('images/coco.png'),
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
            )
          ],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Center(
                child: Text('This product is NOT vegan.',
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
              child: Text(
                "See full ingredient list",
                style: TextStyle(fontSize: 20.0),
              ),
            ),
            SizedBox(height: 10),
            Text(
              "Non-vegan ingredients:",
              style: TextStyle(fontSize: 20.0),
            ),
            Text(ingredient.join(', ') //INSERT NON VEGAN INGREDIENTS
                ),
          ],
        ));
  }
}
