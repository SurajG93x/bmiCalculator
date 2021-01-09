import 'package:flutter/material.dart';
import '../constants.dart';

class MainButton extends StatelessWidget {
  MainButton({@required this.onTap, @required this.buttonString});
  final Function onTap;
  final String buttonString;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(
          child: Text(
            buttonString,
            style: kCalculateTextStyle,
          ),
        ),
        color: KBottomButtonContainerColor,
        margin: EdgeInsets.only(top: 10),
        width: double.infinity,
        height: kBottomButtonContainerHeight,
      ),
    );
  }
}
