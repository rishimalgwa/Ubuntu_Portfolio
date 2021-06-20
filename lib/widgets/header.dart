import 'package:flutter/material.dart';
import 'package:ubuntu_portfolio/constants/mycolors.dart';

class Header extends StatefulWidget {
  const Header({
    Key key,
    @required this.size,
    @required String timeString,
  })  : _timeString = timeString,
        super(key: key);

  final Size size;
  final String _timeString;

  @override
  _HeaderState createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  bool hover = false;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      child: Container(
        width: widget.size.width,
        height: 30,
        color: Colors.black,
        child: Row(
          children: [
            SizedBox(
              width: 8,
            ),
            Text(
              'Activities',
              style: TextStyle(color: Colors.white, fontSize: 13),
            ),
            Spacer(),
            Text(
              widget._timeString,
              style: TextStyle(color: Colors.white, fontSize: 14),
            ),
            Spacer(),
            Container(
              width: 75,
              child: Column(
                children: [
                  SizedBox(
                    height: 2,
                  ),
                  InkWell(
                      onTap: () {
                        setState(() {
                          hover = true;
                        });
                      },
                      child: HeaderIcons()),
                  Spacer(),
                  Container(
                    height: 2,
                    color: hover ? MyColors.orangeS9 : Colors.transparent,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class HeaderIcons extends StatelessWidget {
  const HeaderIcons({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.signal_wifi_4_bar,
          color: Colors.white,
          size: 15,
        ),
        Icon(
          Icons.volume_down,
          color: Colors.white,
          size: 20,
        ),
        Icon(
          Icons.battery_full,
          color: Colors.white,
          size: 15,
        ),
        Icon(
          Icons.arrow_drop_down,
          color: Colors.white,
        ),
      ],
    );
  }
}
