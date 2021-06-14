import 'package:flutter/material.dart';
import 'package:ubuntu_portfolio/constants/constants.dart';
import 'package:ubuntu_portfolio/constants/global.dart';
import 'package:ubuntu_portfolio/widgets/text_widgets.dart';

class AboutMe extends StatelessWidget {
  const AboutMe({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    bool isMobileView = 510 >= size.width;

    return Column(
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
              fontSize: isMobileView && !isMaximize
                  ? 15
                  : isMaximize
                      ? 23
                      : 19,
              fontWeight: FontWeight.w600,
              color: Colors.white),
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          'I’m an Android & Flutter app Developer, passionate about building great apps.',
          style: TextStyle(
              fontSize: isMobileView && !isMaximize
                  ? 12
                  : isMaximize
                      ? 19
                      : 15,
              fontWeight: FontWeight.w400,
              color: MyColors.orangeS9),
        ),
        SizedBox(
          height: 40,
        ),
        Card(
          shadowColor: Colors.black,
          color: Colors.black,
          elevation: 10,
          child: Container(
            padding: const EdgeInsets.all(8),
            width: size.width * .7,
            height: isMobileView ? size.height * .4 : size.height * .23,
            color: MyColors.matBlack,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  AboutBoxText(
                    isMobileView: isMobileView,
                    text:
                        'I’m form most cleanest city of India that is Indore.',
                  ),
                  Divider(
                    color: MyColors.darkGrey,
                  ),
                  AboutBoxText(
                    isMobileView: isMobileView,
                    text:
                        'I’m currently pursuing my Bachelors in Information and Technology form VIT, Vellore.',
                  ),
                  Divider(
                    color: MyColors.darkGrey,
                  ),
                  AboutBoxText(
                    isMobileView: isMobileView,
                    text: 'I love turning ideas into reality.',
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
