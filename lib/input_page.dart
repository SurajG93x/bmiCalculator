import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Widgets/reusable_card.dart';
import 'Widgets/card_icon.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'constants.dart';
import 'results_page.dart';
import 'Widgets/main_button.dart';
import 'Widgets/round_button.dart';
import 'calculator.dart';

enum Gender {
  Male,
  Female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selected;
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
          children: <Widget>[
            Expanded(
                child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                      onPress: () {
                        setState(() {
                          selected = Gender.Male;
                        });
                      },
                      bgcolor: selected ==
                              Gender.Male //Same as the above commented function
                          ? kActiveCardColor
                          : kInactiveCardColor,
                      cardChild: CardIcon(
                        icon: FontAwesomeIcons.mars,
                        iconSize: 60.0,
                        iconText: 'MALE',
                      )),
                ),
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selected = Gender.Female;
                      });
                    },
                    bgcolor: selected == Gender.Female
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    cardChild: CardIcon(
                      icon: FontAwesomeIcons.venus,
                      iconSize: 60.0,
                      iconText: 'FEMALE',
                    ),
                  ),
                ),
              ],
            )),
            Expanded(
              child: ReusableCard(
                bgcolor: kActiveCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  textBaseline: TextBaseline.alphabetic,
                  children: <Widget>[
                    Center(
                      child: Text(
                        'HEIGHT',
                        style: kLabelTextStyle,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      children: <Widget>[
                        Text(
                          height.toString(),
                          style: kNumberTextStyle,
                        ),
                        Text('cm'),
                      ],
                    ),
                    SliderTheme(
                      //Slider theme
                      data: SliderTheme.of(context).copyWith(
                        thumbColor: kSliderThumbColor,
                        overlayColor: kSliderOverlayColor,
                        activeTrackColor: kSliderActiveTrackColor,
                        inactiveTrackColor: kSliderInactiveTrackColor,
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 13),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 20),
                      ),
                      child: Slider(
                        value: height.toDouble(),
                        onChanged: (double newHeight) {
                          setState(() {
                            height = newHeight.toInt();
                          });
                        },
                        min: 120.0,
                        max: 220.0,
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
                child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    bgcolor: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'WEIGHT',
                          style: kLabelTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          children: [
                            Text(
                              weight.toString(),
                              style: kNumberTextStyle,
                            ),
                            Text('kg'),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 45,
                              child: RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onPressed: () {
                                  setState(() {
                                    weight--;
                                    if (weight < 20) weight = 20;
                                  });
                                },
                              ),
                            ),
                            SizedBox(
                              width: 15.0,
                            ),
                            SizedBox(
                              height: 45,
                              child: RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                onPressed: () {
                                  setState(() {
                                    weight++;
                                    if (weight > 120) weight = 120;
                                  });
                                },
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    bgcolor: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'AGE',
                          style: kLabelTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          children: [
                            Text(
                              age.toString(),
                              style: kNumberTextStyle,
                            ),
                            Text('yr'),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 45,
                              child: RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onPressed: () {
                                  setState(() {
                                    age--;
                                    if (age < 1) age = 1;
                                  });
                                },
                              ),
                            ),
                            SizedBox(
                              width: 15.0,
                            ),
                            SizedBox(
                              height: 45,
                              child: RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                onPressed: () {
                                  setState(() {
                                    age++;
                                    if (age > 120) age = 120;
                                  });
                                },
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            )),
            MainButton(
              onTap: () {
                Calculator cal = Calculator(height: height, weight: weight);

                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ResultsPage(
                            bmi: cal.calculateBMI(),
                            resultText: cal.getResult(),
                            resultInterpretation: cal.getInterpretation(),
                          )),
                );
              },
              buttonString: 'CALCULATE',
            )
          ],
        ));
  }
}
