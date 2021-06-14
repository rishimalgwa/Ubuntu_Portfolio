import 'package:flutter/material.dart';
import 'package:ubuntu_portfolio/constants/constants.dart';
import 'package:ubuntu_portfolio/constants/global.dart';
import 'package:ubuntu_portfolio/windows/about_me.dart';

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
    bool isMobileView = 510 >= size.width;

    return Row(
      children: [
        Container(
          width: size.width * .2,
          height: size.height,
          color: MyColors.darkGreyS2,
        ),
        Container(
          padding: const EdgeInsets.all(20),
          width: isMobileView && !isMaximize
              ? size.width * .44
              : isMaximize
                  ? size.width * .8 - 50
                  : size.width * .648,
          height: size.height,
          color: MyColors.darkGrey,
          child: SingleChildScrollView(
            controller: scrollController,
            child: AboutMe(),
          ),
        ),
      ],
    );
  }
}
