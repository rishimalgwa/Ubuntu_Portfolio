import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ubuntu_portfolio/constants/constants.dart';
import 'package:ubuntu_portfolio/constants/global.dart';
import 'package:ubuntu_portfolio/constants/mycolors.dart';
import 'package:ubuntu_portfolio/utils/url_launcher.dart';
import 'package:ubuntu_portfolio/windows/about_me.dart';
import 'package:ubuntu_portfolio/windows/projects.dart';
import 'package:ubuntu_portfolio/windows/skills.dart';

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
            child: Column(
              children: [
                SideTabSelector(
                  icon: FontAwesomeIcons.user,
                  label: Constants.aboutMe,
                ),
                SideTabSelector(
                  icon: FontAwesomeIcons.pencilRuler,
                  label: Constants.skills,
                ),
                SideTabSelector(
                  icon: FontAwesomeIcons.paperclip,
                  label: Constants.projects,
                ),
                SideTabSelector(
                  icon: FontAwesomeIcons.bookOpen,
                  label: Constants.resume,
                ),
              ],
            )),
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
            child: selectWindow(),
          ),
        ),
      ],
    );
  }

  Widget selectWindow() {
    if (showAboutMe) {
      return AboutMe();
    } else if (showSkills) {
      return Skills();
    } else if (showResume) {
      Utils.launchURL(Constants.resumeUrl);
      setState(() {
        showResume = false;
        showAboutMe = true;
      });
      return Container();
    } else if (showProjects) {
      return Projects();
    } else {
      return Container();
    }
  }
}

class SideTabSelector extends StatefulWidget {
  const SideTabSelector({
    Key key,
    @required this.label,
    @required this.icon,
  }) : super(key: key);
  final String label;
  final icon;

  @override
  _SideTabSelectorState createState() => _SideTabSelectorState();
}

class _SideTabSelectorState extends State<SideTabSelector> {
  bool hover = false;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    bool isMobileView = 510 >= size.width;
    return InkWell(
      onTap: () {
        setState(() {
          if (widget.label == Constants.aboutMe) {
            showSkills = showProjects = showResume = false;
            showAboutMe = true;
          } else if (widget.label == Constants.skills) {
            showAboutMe = showProjects = showResume = false;
            showSkills = true;
          } else if (widget.label == Constants.projects) {
            showAboutMe = showSkills = showResume = false;
            showProjects = true;
          } else if (widget.label == Constants.resume) {
            showAboutMe = showSkills = showProjects = false;
            showResume = true;
          }
        });
      },
      onHover: (b) {
        setState(() {
          hover = b;
        });
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 2),
        child: Container(
          padding: const EdgeInsets.fromLTRB(10, 2, 10, 2),
          color: hover ? MyColors.hoverBGColor : Colors.transparent,
          height: size.height * .06,
          child: Row(
            children: [
              Icon(
                widget.icon,
                size: isMobileView ? 12 : 20,
                color: Colors.white,
              ),
              SizedBox(
                width: isMobileView ? 5 : 10,
              ),
              Text(
                widget.label,
                style: TextStyle(
                    color: Colors.white, fontSize: isMobileView ? 10 : 15),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
