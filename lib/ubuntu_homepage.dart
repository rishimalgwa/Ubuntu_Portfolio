import 'dart:async';
// ignore: unused_import
import 'package:battery/battery.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:ubuntu_portfolio/widgets/header.dart';
import 'package:ubuntu_portfolio/widgets/side_taskbar.dart';
import 'package:ubuntu_portfolio/windows/applications_window.dart';

import 'constants/global.dart';
import 'constants/constants.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _timeString = '';
  String src = 'https://devtris.codechefvit.com';
  @override
  void initState() {
    super.initState();
    setState(() {
      showAboutWindow = true;
    });
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

class OnScreenIcons extends StatefulWidget {
  final String path, label;
  final bool isSvg;
  const OnScreenIcons({Key key, this.path, this.label, this.isSvg = false})
      : super(key: key);

  @override
  _OnScreenIconsState createState() => _OnScreenIconsState();
}

class _OnScreenIconsState extends State<OnScreenIcons> {
  bool hover = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          if (widget.label == Constants.aboutRishi) {
            showDevtetrisWindow = false;
            showVsCodeWindow = false;
            showDartpadWindow = false;
            showAboutWindow = true;
          } else if (widget.label == Constants.vsCodeGithub) {
            showDartpadWindow = false;
            showDevtetrisWindow = false;
            showVsCodeWindow = true;
          } else if (widget.label == Constants.playHexties) {
            showDartpadWindow = false;
            showDevtetrisWindow = true;
            showVsCodeWindow = false;
          }
        });
      },
      onHover: (b) {
        setState(() {
          hover = b;
        });
      },
      child: Container(
        height: 70,
        width: 70,
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: hover ? MyColors.hoverBGColor : Colors.transparent,
          borderRadius: BorderRadius.all(Radius.circular(5)),
        ),
        child: Column(
          children: [
            widget.isSvg
                ? SvgPicture.asset(widget.path)
                : Image(
                    image: AssetImage(widget.path),
                    fit: BoxFit.fill,
                    height: 40,
                  ),
            SizedBox(
              height: 8,
            ),
            Text(
              widget.label,
              style: TextStyle(fontSize: 10, color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}

class AboutPage extends StatefulWidget {
  const AboutPage({Key key}) : super(key: key);

  @override
  _AboutPageState createState() => _AboutPageState();
}

ScrollController scrollController;

class _AboutPageState extends State<AboutPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Row(
      children: [
        Container(
          width: size.width * .2,
          height: size.height,
          color: MyColors.darkGreyS2,
        ),
        Container(
          width: isMaximize ? size.width * .8 - 50 : size.width * .648,
          height: size.height,
          color: MyColors.matBlack,
          child: SingleChildScrollView(
            controller: scrollController,
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                ),
                CircleAvatar(
                  radius: isMaximize ? 57 : 50,
                  backgroundImage: NetworkImage(
                      'https://avatars.githubusercontent.com/u/38785008?v=4'),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Hey, Nice to meet you\nI am Rishi Malgwa',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: isMaximize ? 23 : 19,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'I’m an Android & Flutter app Developer, passionate about building great apps.',
                  style: TextStyle(
                      fontSize: isMaximize ? 19 : 15,
                      fontWeight: FontWeight.w400,
                      color: MyColors.orangeS9),
                ),
                SizedBox(
                  height: 50,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '- I’m form most cleanest city of India that is Indore.',
                      style: TextStyle(
                          fontSize: isMaximize ? 19 : 15,
                          fontWeight: FontWeight.w400,
                          color: Colors.white),
                    ),
                    SizedBox(height: 10),
                    Text(
                      '- I’m currently pursuing my Bachelors in Information and Technology form VIT, Vellore.',
                      style: TextStyle(
                          fontSize: isMaximize ? 19 : 15,
                          fontWeight: FontWeight.w400,
                          color: Colors.white),
                    ),
                    SizedBox(height: 10),
                    Text(
                      '- I love turning ideas into reality.',
                      style: TextStyle(
                          fontSize: isMaximize ? 19 : 15,
                          fontWeight: FontWeight.w400,
                          color: Colors.white),
                    ),
                    SizedBox(height: 10),
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
