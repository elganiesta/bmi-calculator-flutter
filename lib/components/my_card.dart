import 'package:flutter/material.dart';




class My_Card extends StatelessWidget {
  final Color colorCard;
  final Widget childCard;

   My_Card({@required this.colorCard, this.childCard});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: childCard,
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
          color: colorCard, borderRadius: BorderRadius.circular(10.0)),
    );
  }
}
