import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _timeString = '';
  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 1), (Timer t) => _getTime());
  }

  void _getTime() {
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
      ],
    ));
  }
}

class Header extends StatefulWidget {
  const Header({
    Key key,
    @required this.size,
    @required String timeString,
  })  : _timeString = timeString,
        super(key: key);

  final Size size;
  final String _timeString;

  @override
  _HeaderState createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  bool hover = false;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      child: Container(
        width: widget.size.width,
        height: 30,
        color: Colors.black,
        child: Row(
          children: [
            SizedBox(
              width: 8,
            ),
            Text(
              'Activities',
              style: TextStyle(color: Colors.white, fontSize: 13),
            ),
            Spacer(),
            Text(
              widget._timeString,
              style: TextStyle(color: Colors.white, fontSize: 14),
            ),
            Spacer(),
            Container(
              width: 75,
              child: Column(
                children: [
                  SizedBox(
                    height: 2,
                  ),
                  InkWell(
                      onTap: () {
                        setState(() {
                          hover = true;
                        });
                      },
                      child: HeaderIcons()),
                  Spacer(),
                  Container(
                    height: 2,
                    color: hover ? Colors.orange.shade900 : Colors.transparent,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class HeaderIcons extends StatelessWidget {
  const HeaderIcons({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.signal_wifi_4_bar,
          color: Colors.white,
          size: 15,
        ),
        Icon(
          Icons.volume_down,
          color: Colors.white,
          size: 20,
        ),
        Icon(
          Icons.battery_full,
          color: Colors.white,
          size: 15,
        ),
        Icon(
          Icons.arrow_drop_down,
          color: Colors.white,
        ),
      ],
    );
  }
}

class SideTaskbar extends StatelessWidget {
  const SideTaskbar({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      child: Container(
        height: size.height,
        width: 50,
        color: Colors.black.withOpacity(.5),
        child: Column(
          children: [
            SizedBox(
              height: size.height * .01,
            ),
            Container(
              height: size.height * .7,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TaskBarIcon(
                    path: "assets/images/chrome.png",
                    label: 'Chrome',
                  ),
                  TaskBarIcon(
                    path: "assets/images/user-home.png",
                    label: 'About Rishi',
                  ),
                  TaskBarIcon(
                    path: "assets/images/vscode.png",
                    label: 'Visual Studio Code',
                  ),
                  TaskBarIcon(
                    path: "assets/images/bash.png",
                    label: 'Terminal',
                  ),
                  TaskBarIcon(
                    path: "assets/images/gnome-control-center.png",
                    label: 'Settings',
                  ),
                ],
              ),
            ),
            Spacer(),
            TaskBarIcon(
                path: 'assets/svgs/view-app-grid-symbolic.svg',
                label: 'Show Applications',
                isSvg: true),
            SizedBox(
              height: 15,
            )
          ],
        ),
      ),
    );
  }
}

class TaskBarIcon extends StatefulWidget {
  final String path, label;
  final bool isSvg;
  const TaskBarIcon({
    Key key,
    @required this.path,
    @required this.label,
    this.isSvg = false,
  }) : super(key: key);

  @override
  _TaskBarIconState createState() => _TaskBarIconState();
}

class _TaskBarIconState extends State<TaskBarIcon> {
  bool hover = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onHover: (b) {
        setState(() {
          hover = b;
        });
      },
      onTap: () {},
      child: Tooltip(
        message: widget.label,
        child: Container(
          height: 38,
          width: 38,
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: hover ? Colors.white.withOpacity(.15) : Colors.transparent,
            borderRadius: BorderRadius.all(Radius.circular(5)),
            // image: DecorationImage(
            //   image: AssetImage(widget.path),
            //   fit: BoxFit.fill,
            // ),
          ),
          child: widget.isSvg
              ? SvgPicture.asset(widget.path)
              : Image(
                  image: AssetImage(widget.path),
                  fit: BoxFit.fill,
                ),
        ),
      ),
    );
  }
}
