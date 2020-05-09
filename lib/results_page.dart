import 'package:flutter/material.dart';
import 'constants.dart';
import 'components/my_card.dart';

class Results extends StatelessWidget {

  final String bmiResult;
  final String textResult;
  final String interpretaionResult;

  Results({@required this.bmiResult, @required this.textResult, @required this.interpretaionResult });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(10.0),
              alignment: Alignment.bottomLeft,
              child: Text(
                'Your Result',
                style: titleTextStyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: My_Card(
              colorCard: activeContainerColor,
              childCard: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    textResult.toUpperCase(),
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    bmiResult,
                    style: TextStyle(
                      fontSize: 80.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    interpretaionResult,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              child: Center(
                child: Text(
                  'RE-CALCULATE',
                  style: buttonTextStyle,
                ),
              ),
              padding: EdgeInsets.only(bottom: 10.0),
              color: bottomContainerColor,
              width: double.infinity,
              margin: EdgeInsets.only(top: 15.0),
              height: bottomContainerHeight,
            ),
          ),
        ],
      ),
    );
  }
}
