import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ubuntu_portfolio/constants/constants.dart';
import 'package:ubuntu_portfolio/constants/global.dart';
import 'package:ubuntu_portfolio/constants/mycolors.dart';

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
