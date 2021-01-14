import 'dart:async';
import 'package:csv/csv.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'takePicture.dart';

Future<void> main() async {
  // Ensure that plugin services are initialized so that `availableCameras()`
  // can be called before `runApp()`
  WidgetsFlutterBinding.ensureInitialized();

  // Obtain a list of the available cameras on the device.
  final cameras = await availableCameras();

  // Get a specific camera from the list of available cameras.
  final firstCamera = cameras.first;

  final myData = await rootBundle.loadString("assets/ingredients.csv");
  List<List<dynamic>> csvTable = CsvToListConverter().convert(myData);
  List<String> stuffs = csvTable[0][0].split('\n');

  runApp(
    MaterialApp(
      title: 'Custom Fonts',
      // Set Raleway as the default app font.
      theme: ThemeData(
        fontFamily: 'Raleway',
        primaryColor: new Color(0xffbda0bc),
        accentColor: new Color(0xff824670),
      ),

      home: TakePictureScreen(
        // Pass the appropriate camera to the TakePictureScreen widget.
        camera: firstCamera,
        stuff: stuffs,
      ),
    ),
  );
}
