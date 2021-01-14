import 'package:flutter/material.dart';
import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'dart:io';
import 'nonvegan.dart';
import 'vegan.dart';

// A widget that displays the picture taken by the user.
class DisplayPictureScreen extends StatelessWidget {
  final String imagePath;
  final List<String> stuffs;

  const DisplayPictureScreen({Key key, this.imagePath, this.stuffs})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Captured Image')),
      // The image is stored as a file on the device. Use the `Image.file`
      // constructor with the given path to display the image.
      body: _buildImage(context),
    );
  }

  bool checkVegan(String ingredient) {
    for (String non_vegan in stuffs) {
      if (ingredient.toLowerCase().compareTo(non_vegan.toLowerCase()) == 0) {
        return false;
      }
    }
    return true;
  }

  Future<VisionText> getVisionText() async {
    final FirebaseVisionImage visionImage =
        FirebaseVisionImage.fromFile(File(imagePath));
    final TextRecognizer cloudTextRecognizer =
        FirebaseVision.instance.cloudTextRecognizer();
    final VisionText visionText =
        await cloudTextRecognizer.processImage(visionImage);
    return visionText;
  }

  Widget _buildChild() {
    return FutureBuilder<VisionText>(
        future: getVisionText(),
        builder: (context, AsyncSnapshot<VisionText> snapshot) {
          if (snapshot.hasData) {
            VisionText visionText = snapshot.data;
            String text = visionText.text;
            bool veg = true;
            List<String> ingrs = new List();
            List<String> non_veg_ingrs = new List();
            for (TextBlock block in visionText.blocks) {
              final Rect boundingBox = block.boundingBox;
              final List<Offset> cornerPoints = block.cornerPoints;
              final String text = block.text;
              final List<RecognizedLanguage> languages =
                  block.recognizedLanguages;

              for (TextLine line in block.lines) {
                // Same getters as TextBlock
                for (TextElement element in line.elements) {
                  // Same getters as TextBlock
                  String word =
                      element.text.replaceAll(new RegExp(r"[^A-Za-z0-9]+"), "");
                  ingrs.add(word);
                  if (!checkVegan(word)) {
                    non_veg_ingrs.add(word);
                    veg = false;
                  }
                }
              }
            }
            if (veg) {
              return new Vegan(ingredients: ingrs);
            } else {
              return new NonVegan(
                  nonVegIngr: non_veg_ingrs, ingredients: ingrs);
            }
          } else {
            return CircularProgressIndicator();
          }
        });
  }

  Widget _buildImage(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.file(File(imagePath)),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
            width: double.infinity,
            child: FlatButton(
              child: Text('Check if vegan', style: TextStyle(fontSize: 24)),
              onPressed: () {
                Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (context) => _buildChild()), //CHANGE LATER
                );
              },
              color: new Color(0xffc3d2d5),
              textColor: Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}
