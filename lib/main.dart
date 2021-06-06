import 'dart:html';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ubuntu_portfolio/ubuntu_homepage.dart';
import 'dart:ui' as ui;

void main() {
  // ignore: undefined_prefixed_name
  ui.platformViewRegistry.registerViewFactory(
      'dev-tetris',
      (int viewId) => IFrameElement()
        ..width = '640'
        ..height = '360'
        ..src = 'https://devtris.codechefvit.com'
        ..style.border = 'none');
  // ignore: undefined_prefixed_name
  ui.platformViewRegistry.registerViewFactory(
      'vscode-github',
      (int viewId) => IFrameElement()
        ..width = '640'
        ..height = '360'
        ..src = 'https://github1s.com/rishimalgwa/Ubuntu_Portfolio'
        ..style.border = 'none');
  // ignore: undefined_prefixed_name
  ui.platformViewRegistry.registerViewFactory(
      'dart-pad',
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
          textTheme: GoogleFonts.ubuntuTextTheme(
        Theme.of(context).textTheme,
      )),
      home: MyHomePage(),
    );
  }
}
