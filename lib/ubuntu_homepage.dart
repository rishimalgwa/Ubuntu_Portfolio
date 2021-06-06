import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

import 'constants/global.dart';

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
        ApplicationWindow(
          size: size,
          show: showDartpadWindow,
          viewType: 'dart-pad',
        ),
        ApplicationWindow(
          size: size,
          show: showVsCodeWindow,
          viewType: 'vscode-github',
        ),
        ApplicationWindow(
          size: size,
          show: showDevtetrisWindow,
          viewType: 'dev-tetris',
        ),
      ],
    ));
  }
}

class ApplicationWindow extends StatelessWidget {
  final bool show;
  final String viewType;
  const ApplicationWindow({
    Key key,
    @required this.size,
    this.show,
    this.viewType,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: show,
      child: Positioned(
        bottom: 0,
        right: 0,
        child: Container(
          height: size.height - 30,
          width: size.width - 50,
          child: HtmlElementView(viewType: viewType),
        ),
      ),
    );
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

class SideTaskbar extends StatefulWidget {
  const SideTaskbar({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  _SideTaskbarState createState() => _SideTaskbarState();
}

class _SideTaskbarState extends State<SideTaskbar> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      child: Container(
        height: widget.size.height,
        width: 50,
        color: Colors.black.withOpacity(.5),
        child: Column(
          children: [
            SizedBox(
              height: widget.size.height * .02,
            ),
            Container(
              height: widget.size.height * .7,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TaskBarIcon(
                    path: "assets/images/dart_logo.png",
                    label: 'DartPad',
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
                    path: "assets/images/hextris.png",
                    label: 'Play Hextris',
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
      onTap: () {
        setState(() {
          if (widget.label == 'DartPad') {
            showDevtetrisWindow = false;
            showVsCodeWindow = false;
            showDartpadWindow = true;
          } else if (widget.label == 'Visual Studio Code') {
            showDartpadWindow = false;
            showDevtetrisWindow = false;
            showVsCodeWindow = true;
          } else if (widget.label == 'Play Hextris') {
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
