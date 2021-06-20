import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ubuntu_portfolio/constants/lists.dart';
import 'package:ubuntu_portfolio/widgets/cards.dart';
import 'package:flutter_tags/flutter_tags.dart';

class Skills extends StatefulWidget {
  const Skills({Key key}) : super(key: key);

  @override
  _SkillsState createState() => _SkillsState();
}

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
            itemList: kLists.langList,
            iconList: kLists.langIconList,
            iconColorList: kLists.langLogoColors,
          ),
        ),
        SizedBox(
          height: 20,
        ),
        SkillsLabelCard(
          label: 'Frameworks and Tools',
          child: SkillTags(
            iconColorList: kLists.toolsLogoColors,
            iconList: kLists.frameToolsLogo,
            itemList: kLists.frameTools,
          ),
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
    @required this.iconColorList,
  }) : super(key: key);

  final List itemList;
  final List iconList;
  final List iconColorList;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    bool isMobileView = 510 >= size.width;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Tags(
        itemCount: itemList.length,
        itemBuilder: (index) {
          return ItemTags(
            alignment: MainAxisAlignment.spaceAround,
            combine: ItemTagsCombine.withTextAfter,
            textActiveColor: Colors.black,
            image: ItemTagsImage(
                child: SvgPicture.string(
              iconList[index],
              color: iconColorList[index],
              height: isMobileView ? 18 : 23,
            )),
            activeColor: Colors.white,
            index: index,
            title: itemList[index],
            textStyle: TextStyle(
                fontSize: isMobileView ? 11 : 15, color: Colors.black),
          );
        },
      ),
    );
  }
}
