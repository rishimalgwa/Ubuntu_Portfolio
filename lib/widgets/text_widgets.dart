import 'package:flutter/material.dart';
import 'package:ubuntu_portfolio/constants/global.dart';

class AboutBoxText extends StatelessWidget {
  const AboutBoxText({
    Key key,
    @required this.isMobileView,
    @required this.text,
  }) : super(key: key);

  final bool isMobileView;
  final text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontSize: isMobileView && !isMaximize
              ? 12
              : isMaximize
                  ? 19
                  : 15,
          fontWeight: FontWeight.w400,
          color: Colors.white),
    );
  }
}
