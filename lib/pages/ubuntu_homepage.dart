import 'dart:async';

// ignore: unused_import
import 'package:battery/battery.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ubuntu_portfolio/widgets/header.dart';
import 'package:ubuntu_portfolio/widgets/icons.dart';
import 'package:ubuntu_portfolio/widgets/side_taskbar.dart';
import 'package:ubuntu_portfolio/windows/applications_window.dart';

import '../constants/constants.dart';
import '../constants/global.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _timeString = '';
  String src = 'https://devtris.codechefvit.com';
  @override
  void initState() {
    super.initState();
    // setState(() {
    //   showAboutWindow = true;
    // });
    Timer.periodic(Duration(seconds: 1), (Timer t) => _getTime());
  }

  void _getTime() async {
    // var _battery = Battery();
    // print(await _battery.batteryLevel);
    final String formattedDateTime =
        DateFormat('EEE MMM d h:mm a').format(DateTime.now()).toString();
    setState(() {
      _timeString = formattedDateTime;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        body: Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/ubuntu_bg.png"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SideTaskbar(size: size),
        Header(size: size, timeString: _timeString),
        Visibility(
          visible:
              !showDartpadWindow && !showDevtetrisWindow && !showVsCodeWindow,
          child: Positioned(
            left: 51,
            bottom: 0,
            child: Container(
              height: size.height - 30,
              width: 80,
              child: Column(
                children: [
                  SizedBox(
                    height: size.height * .02,
                  ),
                  OnScreenIcons(
                    path: "assets/images/user-home.png",
                    label: Constants.aboutRishi,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  OnScreenIcons(
                    path: "assets/images/user-trash-full.png",
                    label: Constants.trash,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  OnScreenIcons(
                    path: "assets/images/thunderbird-email.png",
                    label: Constants.sendEmail,
                  ),
                ],
              ),
            ),
          ),
        ),
        ApplicationWindow(
          size: size,
          show: showDartpadWindow,
          viewType: Constants.dartpad,
        ),
        ApplicationWindow(
          size: size,
          show: showVsCodeWindow,
          viewType: Constants.vsCodeGithub,
        ),
        ApplicationWindow(
          size: size,
          show: showDevtetrisWindow,
          viewType: Constants.playHexties,
        ),
        ApplicationWindow(
          size: size,
          show: showAboutWindow,
          viewType: Constants.aboutRishi,
          isWebApp: false,
        )
      ],
    ));
  }
}
