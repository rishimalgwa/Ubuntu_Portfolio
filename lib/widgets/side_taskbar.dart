import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ubuntu_portfolio/constants/global.dart';
import 'package:ubuntu_portfolio/constants/constants.dart';
import 'package:ubuntu_portfolio/constants/mycolors.dart';

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
                    label: Constants.dartpad,
                  ),
                  TaskBarIcon(
                    path: "assets/images/vscode.png",
                    label: Constants.vsCodeGithub,
                  ),
                  TaskBarIcon(
                    path: "assets/images/bash.png",
                    label: Constants.terminal,
                  ),
                  TaskBarIcon(
                    path: "assets/images/hextris.png",
                    label: Constants.playHexties,
                  ),
                  TaskBarIcon(
                    path: "assets/images/gnome-control-center.png",
                    label: Constants.settings,
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
          if (widget.label == Constants.dartpad) {
            showDevtetrisWindow = false;
            showVsCodeWindow = false;
            showDartpadWindow = true;
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
      child: Tooltip(
        message: widget.label,
        child: Container(
          height: 38,
          width: 38,
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: hover ? MyColors.hoverBGColor : Colors.transparent,
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
