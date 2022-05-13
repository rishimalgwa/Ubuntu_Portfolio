import 'package:flutter/material.dart';

class Skills extends StatefulWidget {
  const Skills({Key? key}) : super(key: key);

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
        // SkillsLabelCard(
        //   label: 'Languages',
        //   child: SkillTags(
        //     itemList: kLists.langList,
        //     iconList: kLists.langIconList,
        //     iconColorList: kLists.langLogoColors,
        //   ),
        // ),
        // SizedBox(
        //   height: 20,
        // ),
        // SkillsLabelCard(
        //   label: 'Frameworks and Tools',
        //   child: SkillTags(
        //     iconColorList: kLists.toolsLogoColors,
        //     iconList: kLists.frameToolsLogo,
        //     itemList: kLists.frameTools,
        //   ),
        // ),
      ],
    );
  }
}
