import 'package:flutter/material.dart';
import '../constants.dart';

class ContentCard extends StatelessWidget {
  final IconData iconCard;
  final String textCard;

  ContentCard({this.iconCard, this.textCard});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          iconCard,
          size: 80.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          textCard,
          style: labelStyle,
        ),
      ],
    );
  }
}