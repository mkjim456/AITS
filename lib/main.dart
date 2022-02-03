import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/gallery_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Gallery App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: GalleryScreen(),
    );
  }
}
