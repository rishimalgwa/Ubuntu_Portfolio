import 'dart:html';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ubuntu_portfolio/ubuntu_homepage.dart';
import 'dart:ui' as ui;

import 'constants/constants.dart';

void main() {
  // ignore: undefined_prefixed_name
  ui.platformViewRegistry.registerViewFactory(
      Constants.playHexties,
      (int viewId) => IFrameElement()
        ..src = 'https://devtris.codechefvit.com'
        ..style.border = 'none');
  // ignore: undefined_prefixed_name
  ui.platformViewRegistry.registerViewFactory(
      Constants.vsCodeGithub,
      (int viewId) => IFrameElement()
        ..src = 'https://github1s.com/rishimalgwa/Ubuntu_Portfolio'
        ..style.border = 'none');
  // ignore: undefined_prefixed_name
  ui.platformViewRegistry.registerViewFactory(
      Constants.dartpad,
      (int viewId) =>
          IFrameElement()..src = 'https://www.dartpad.dev/?null_safety=true');

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
          scrollbarTheme: ScrollbarThemeData().copyWith(
            thumbColor: MaterialStateProperty.all(Colors.white60),
          ),
          textTheme: GoogleFonts.ubuntuTextTheme(
            Theme.of(context).textTheme,
          )),
      home: MyHomePage(),
    );
  }
}
