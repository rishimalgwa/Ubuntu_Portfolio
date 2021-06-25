import 'package:flutter/material.dart';
import 'package:ubuntu_portfolio/constants/global.dart';
import 'package:ubuntu_portfolio/constants/mycolors.dart';
import 'package:ubuntu_portfolio/widgets/tags.dart';

class AboutGreyCard extends StatelessWidget {
  const AboutGreyCard({
    Key key,
    @required this.size,
    @required this.isMobileView,
    @required this.child,
  }) : super(key: key);
  final Widget child;
  final Size size;
  final bool isMobileView;

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: Colors.black,
      color: Colors.black,
      elevation: 10,
      child: Container(
        padding: const EdgeInsets.all(8),
        width: size.width * .7,
        height: isMobileView ? size.height * .4 : size.height * .3,
        color: MyColors.matBlack,
        child: child,
      ),
    );
  }
}

class SkillsLabelCard extends StatelessWidget {
  const SkillsLabelCard({
    Key key,
    @required this.label,
    @required this.child,
  }) : super(key: key);

  final String label;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    bool isMobileView = 510 >= size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8),
          child: Text(
            label,
            style: TextStyle(
                fontSize: isMobileView ? 16 : 20, color: Colors.white),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        AboutGreyCard(size: size, isMobileView: isMobileView, child: child)
      ],
    );
  }
}

class ProjectsCard extends StatelessWidget {
  const ProjectsCard({
    Key key,
    @required this.title,
    @required this.date,
    @required this.description,
    this.itemList,
    this.iconList,
    this.iconColorList,
  }) : super(key: key);

  final title, date, description;
  final List itemList;
  final List iconList;
  final List iconColorList;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    bool isMobileView = 510 >= size.width;
    return Card(
      shadowColor: Colors.white,
      child: Container(
        padding: const EdgeInsets.all(8),
        color: MyColors.darkGrey,
        width: double.infinity,
        // height: 100,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  title,
                  style: TextStyle(
                      fontSize: isMobileView
                          ? isMaximize
                              ? 20
                              : 11
                          : 25,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
                Spacer(),
                Text(date,
                    style: TextStyle(
                        fontSize: isMobileView
                            ? isMaximize
                                ? 10
                                : 6
                            : 14,
                        color: Colors.white))
              ],
            ),
            SizedBox(height: 10),
            Text(
              description,
              style: TextStyle(
                  fontSize: isMobileView
                      ? isMaximize
                          ? 12
                          : 10
                      : 16,
                  color: Colors.white),
            ),
            SizedBox(
              height: 5,
            ),
            SkillTags(
              itemList: itemList,
              iconList: iconList,
              iconColorList: iconColorList,
              fontsize: 12,
              height: 15,
            ),
          ],
        ),
      ),
    );
  }
}
