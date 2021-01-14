import 'package:flutter/material.dart';

//A widget that displays the ingredient list
class IngrList extends StatelessWidget {
  final List<String> ingrs;
  IngrList({Key key, @required this.ingrs}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          title: new Text("Ingredients List"),
          actions: <Widget>[
            IconButton(
              icon: new Image.asset('images/coco.png'),
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
                Navigator.pop(context);
              },
            )
          ],
        ),
        body: Column(
          children: <Widget>[
            Text(ingrs.join(', ')) //INSERT LIST OF INGREDIENTS
          ],
        ));
  }
}
