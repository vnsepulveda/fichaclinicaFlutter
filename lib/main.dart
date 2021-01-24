import 'package:flutter/material.dart';
import 'package:trabajotitulo/view/homePage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ficha clínica',
      debugShowCheckedModeBanner: false,
      home: homePage(),
    );
  }
}

