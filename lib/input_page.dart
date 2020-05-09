import 'package:bmi_calculator/results_page.dart';
import 'package:flutter/material.dart';
import 'components/content_card.dart';
import 'components/my_card.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'constants.dart';
import 'components/round_icon_button.dart';
import 'calculate_brain.dart';

enum Gender {
  male,
  female,
}

enum Operation {
  plus,
  minus,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCardColor = inactiveContainerColor;
  Color femaleCardColor = inactiveContainerColor;

  void updateColor(Gender selectedGender) {
    maleCardColor = (selectedGender == Gender.male)
        ? activeContainerColor
        : inactiveContainerColor;
    femaleCardColor = (selectedGender == Gender.female)
        ? activeContainerColor
        : inactiveContainerColor;
  }

  int height = 180;
  int weight = 60;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        updateColor(Gender.male);
                      });
                    },
                    child: My_Card(
                        childCard: ContentCard(
                          iconCard: FontAwesomeIcons.mars,
                          textCard: 'MALE',
                        ),
                        colorCard: maleCardColor),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        updateColor(Gender.female);
                      });
                    },
                    child: My_Card(
                        childCard: ContentCard(
                          iconCard: FontAwesomeIcons.venus,
                          textCard: 'FEMALE',
                        ),
                        colorCard: femaleCardColor),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: My_Card(
              colorCard: activeContainerColor,
              childCard: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'HEIGHT',
                    style: labelStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        height.toString(),
                        style: nbrStyle,
                      ),
                      Text(
                        'cm',
                        style: TextStyle(
                          color: Color(0xff8D8E98),
                        ),
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Colors.white,
                      thumbColor: Color(0xffFF4659),
                      overlayColor: Color(0x15FF4659),
                      inactiveTrackColor: Color(0xff8D8E98),
                    ),
                    child: Slider(
                        value: height.toDouble(),
                        min: 120.0,
                        max: 220.0,
                        onChanged: (double newHeight) {
                          setState(() {
                            height = newHeight.round();
                          });
                        }),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: My_Card(
                    colorCard: activeContainerColor,
                    childCard: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'WEIGHT',
                          style: labelStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: nbrStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              child: Icon(
                                FontAwesomeIcons.minus,
                              ),
                              onPressed: () {
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              child: Icon(
                                FontAwesomeIcons.plus,
                              ),
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: My_Card(
                    colorCard: activeContainerColor,
                    childCard: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'AGE',
                          style: labelStyle,
                        ),
                        Text(
                          age.toString(),
                          style: nbrStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              child: Icon(
                                FontAwesomeIcons.minus,
                              ),
                              onPressed: () {
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              child: Icon(
                                FontAwesomeIcons.plus,
                              ),
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {

              CalculateBrain calc = CalculateBrain(height: height, weight: weight);

              Navigator.push(context, MaterialPageRoute(builder: (context) => Results(
                bmiResult: calc.calculateBMI(),
                textResult: calc.getResult(),
                interpretaionResult: calc.getInterpretation(),
              )));
            },
            child: Container(
              child: Center(
                child: Text(
                  'CALCULATE',
                  style: buttonTextStyle,
                ),
              ),
              padding: EdgeInsets.only(bottom : 10.0),
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

