import 'package:flutter/material.dart';
import '../constants.dart';

class CardIcon extends StatelessWidget {
  CardIcon({@required this.icon, this.iconText, this.iconSize});

  final IconData icon;
  final double iconSize;
  final String iconText;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: iconSize,
        ),
        SizedBox(
          height: 15,
        ),
        Text(iconText, style: kLabelTextStyle)
      ],
    );
  }
}
