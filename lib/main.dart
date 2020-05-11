import 'package:covid_19/constants.dart';
import 'package:covid_19/src/pages/HomePage.dart';
import 'package:flutter/material.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'COVID 19',
      //Define el tema de la aplicacion (Color de fondo, fuente y color de letra)
      theme: ThemeData(
        scaffoldBackgroundColor: kBackgroundColor,
        fontFamily: "Poppins",
        textTheme: TextTheme(body1: TextStyle(color: kBodyTextColor))
      ),
      home: HomePage()
    );
  }
}