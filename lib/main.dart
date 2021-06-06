import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ubuntu_portfolio/ubuntu_homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Rishi\'s Portfolio',
      theme: ThemeData(
          // primarySwatch: Colors.blue,
          textTheme: GoogleFonts.ubuntuTextTheme(
        Theme.of(context).textTheme,
      )),
      home: MyHomePage(),
    );
  }
}
