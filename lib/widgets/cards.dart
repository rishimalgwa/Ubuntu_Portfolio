import 'package:flutter/material.dart';
import 'package:ubuntu_portfolio/constants/constants.dart';

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
