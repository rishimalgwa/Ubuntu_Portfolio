import 'package:flutter/material.dart';
import 'package:ubuntu_portfolio/constants/global.dart';
import 'package:ubuntu_portfolio/constants/lists.dart';
import 'package:ubuntu_portfolio/widgets/cards.dart';

class Projects extends StatefulWidget {
  const Projects({Key key}) : super(key: key);

  @override
  _ProjectsState createState() => _ProjectsState();
}

class _ProjectsState extends State<Projects> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    bool isMobileView = 510 >= size.width;
    return SingleChildScrollView(
      child: Column(
        children: [
          Text(
            'Projects',
            style: TextStyle(
                fontSize: isMobileView
                    ? isMaximize
                        ? 20
                        : 15
                    : 25,
                fontWeight: FontWeight.w600,
                color: Colors.white),
          ),
          SizedBox(
            height: 50,
          ),
          ProjectsCard(
            date: '04/2021',
            title: 'Flick',
            description: '- Youtube clone in Flutter with Firebase as backend',
            itemList: kLists.flutterFirebaseTech,
            iconList: kLists.flutterFirebaseTechLogo,
            iconColorList: kLists.flutterFirebaseTechLogoColors,
          ),
          SizedBox(
            height: 10,
          ),
          ProjectsCard(
            date: '03/2021',
            title: 'Meme Share',
            description:
                '- A fun meme sharing app made with Flutter and Rest Api',
            itemList: kLists.flutterFirebaseTech.sublist(0, 2),
            iconList: kLists.flutterFirebaseTechLogo.sublist(0, 2),
            iconColorList: kLists.flutterFirebaseTechLogoColors.sublist(0, 2),
          ),
          SizedBox(
            height: 10,
          ),
          ProjectsCard(
            date: '08/2020 - 09/2020',
            title: 'Password Manager',
            description:
                '- Created a Password Manager app in Flutter with Firebase as backend',
            itemList: kLists.flutterFirebaseTech,
            iconList: kLists.flutterFirebaseTechLogo,
            iconColorList: kLists.flutterFirebaseTechLogoColors,
          )
        ],
      ),
    );
  }
}
