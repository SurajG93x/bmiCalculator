import 'file:///D:/Users/suraj/GitHub/bmi-calculator/lib/Widgets/main_button.dart';
import 'package:flutter/material.dart';
import 'constants.dart';
import 'Widgets/reusable_card.dart';

class ResultsPage extends StatelessWidget {
  ResultsPage(
      {@required this.bmi,
      @required this.resultText,
      @required this.resultInterpretation});

  final String bmi;
  final String resultText;
  final String resultInterpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            flex: 5,
            child: ReusableCard(
              bgcolor: kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    resultText.toUpperCase(),
                    style: kResultTextStyle,
                  ),
                  Text(
                    bmi,
                    style: kBMITextStyle,
                  ),
                  Text(
                    resultInterpretation,
                    textAlign: TextAlign.center,
                    style: kResultInterStyle,
                  )
                ],
              ),
            ),
          ),
          MainButton(
              onTap: () {
                Navigator.pop(context);
              },
              buttonString: 'RE-CALCULATE')
        ],
      ),
    );
  }
}
