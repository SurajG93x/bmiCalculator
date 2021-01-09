import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  //stateless widgets are immutable. They need to be destroyed and recreated to make any changes
  ReusableCard({@required this.bgcolor, this.cardChild, this.onPress});

  final Color bgcolor; //Final makes the color immutable(cant change it again)
  final Widget cardChild;

  final Function onPress;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: bgcolor,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
