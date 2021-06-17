import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ubuntu_portfolio/widgets/cards.dart';
import 'package:flutter_tags/flutter_tags.dart';

class Skills extends StatefulWidget {
  const Skills({Key key}) : super(key: key);

  @override
  _SkillsState createState() => _SkillsState();
}

List sportList = ['Dart', 'Java', 'C++', 'C', 'Javascript', 'Python', 'Kotlin'];
//List langIconList = [Icons.dart,FontAwesomeIcons.python,Icons.flutter_dash];

class _SkillsState extends State<Skills> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    bool isMobileView = 510 >= size.width;
    return Column(
      children: [
        Text(
          'Skills',
          style: TextStyle(
              fontSize: isMobileView ? 20 : 25,
              fontWeight: FontWeight.w600,
              color: Colors.white),
        ),
        SizedBox(
          height: isMobileView ? 18 : 25,
        ),
        SkillsLabelCard(
          label: 'Languages',
          child: SkillTags(
            itemList: sportList,
            iconList: [],
          ),
        ),
        SizedBox(
          height: 20,
        ),
        SkillsLabelCard(
          label: 'Frameworks and Tools',
          child: null,
        ),
      ],
    );
  }
}

class SkillTags extends StatelessWidget {
  const SkillTags({
    Key key,
    @required this.itemList,
    @required this.iconList,
  }) : super(key: key);

  final List itemList;
  final List iconList;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Tags(
              itemCount: itemList.length,
              itemBuilder: (index) {
                return ItemTags(
                  alignment: MainAxisAlignment.start,
                  combine: ItemTagsCombine.withTextAfter,
                  textActiveColor: Colors.black,
                  image: ItemTagsImage(
                      child: SvgPicture.asset(
                    'assets/svgs/window-minimize-symbolic.svg',
                    color: Colors.pink,
                  )),
                  activeColor: Colors.white,
                  //icon: ItemTagsIcon(icon: iconList[index]),
                  border: Border.all(width: 2, color: Colors.black),
                  index: index,
                  title: itemList[index],
                  textStyle: TextStyle(fontSize: 15, color: Colors.black),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
