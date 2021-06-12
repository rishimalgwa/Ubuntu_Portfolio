import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ubuntu_portfolio/constants/constants.dart';
import 'package:ubuntu_portfolio/constants/global.dart';

import '../ubuntu_homepage.dart';

class ApplicationWindow extends StatefulWidget {
  final bool show;
  final String viewType;
  final Size size;
  final bool isWebApp;
  const ApplicationWindow({
    Key key,
    @required this.size,
    this.show,
    this.viewType,
    this.isWebApp = true,
  }) : super(key: key);

  @override
  _ApplicationWindowState createState() => _ApplicationWindowState();
}

class _ApplicationWindowState extends State<ApplicationWindow> {
  bool minHover = false;
  bool maxHover = false;
  bool closeHover = false;
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: widget.show,
      child: Positioned(
        bottom: isMaximize ? 0 : 100,
        right: isMaximize ? 0 : 90,
        left: isMaximize ? null : 90,
        child: Container(
          height:
              isMaximize ? widget.size.height - 30 : widget.size.height * .55,
          width: isMaximize ? widget.size.width - 50 : widget.size.width * .3,
          child: Column(
            children: [
              Container(
                height: 25,
                decoration: BoxDecoration(
                    color: MyColors.darkGrey,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(5),
                        topRight: Radius.circular(5))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 30,
                    ),
                    Text(
                      widget.viewType,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Colors.white),
                    ),
                    Container(
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () {},
                            onHover: (h) {
                              setState(() {
                                minHover = h;
                              });
                            },
                            child: CircleAvatar(
                              backgroundColor: minHover
                                  ? MyColors.hoverBGColor
                                  : Colors.transparent,
                              radius: 9,
                              child: Center(
                                child: SvgPicture.asset(
                                  'assets/svgs/window-minimize-symbolic.svg',
                                  height: 20,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 12,
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                isMaximize = !isMaximize;
                              });
                            },
                            onHover: (h) {
                              setState(() {
                                maxHover = h;
                              });
                            },
                            child: CircleAvatar(
                              backgroundColor: maxHover
                                  ? MyColors.hoverBGColor
                                  : Colors.transparent,
                              radius: 9,
                              child: Center(
                                child: SvgPicture.asset(
                                  isMaximize
                                      ? 'assets/svgs/window-restore-symbolic.svg'
                                      : 'assets/svgs/window-maximize-symbolic.svg',
                                  height: 20,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 12,
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                if (widget.viewType == Constants.dartpad) {
                                  showDartpadWindow = false;
                                } else if (widget.viewType ==
                                    Constants.vsCodeGithub) {
                                  showVsCodeWindow = false;
                                } else if (widget.viewType ==
                                    Constants.playHexties) {
                                  showDevtetrisWindow = false;
                                }
                              });
                            },
                            onHover: (h) {
                              setState(() {
                                closeHover = h;
                              });
                            },
                            child: CircleAvatar(
                              backgroundColor: closeHover
                                  ? Colors.orange.shade800
                                  : MyColors.orangeS9,
                              radius: 9,
                              child: Center(
                                child: SvgPicture.asset(
                                  'assets/svgs/window-close-symbolic.svg',
                                  height: 20,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: widget.isWebApp
                    ? HtmlElementView(viewType: widget.viewType)
                    : widget.viewType == 'About Rishi'
                        ? AboutPage()
                        : null,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
