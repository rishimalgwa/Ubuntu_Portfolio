import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_tags/flutter_tags.dart';

class SkillTags extends StatelessWidget {
  const SkillTags({
    Key key,
    @required this.itemList,
    @required this.iconList,
    @required this.iconColorList,
    this.height = 23,
    this.fontsize = 15,
  }) : super(key: key);

  final List itemList;
  final List iconList;
  final List iconColorList;
  final double height, fontsize;
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
              height: isMobileView ? height - 5 : height,
            )),
            activeColor: Colors.white,
            index: index,
            title: itemList[index],
            textStyle: TextStyle(
                fontSize: isMobileView ? fontsize - 5 : fontsize,
                color: Colors.black),
          );
        },
      ),
    );
  }
}
