import 'package:flutter/material.dart';

import '../constants/constands.dart';
import '../widgets/bottom_button.dart';
import 'input_page.dart';

class ResultsPage extends StatelessWidget {
  const ResultsPage(
      {super.key,
      required this.result,
      required this.interpretation,
      required this.bmi});

  final String result;
  final String interpretation;
  final String bmi;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(appTitle),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              child: Text(
                'Your Result',
                style: kTitleTextStyle,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  result,
                  style: kResultTextStyle,
                ),
                Text(
                  bmi,
                  style: kBMITextStyle,
                ),
                Text(
                  interpretation,
                  style: TextStyle(fontSize: 22.0),
                )
              ],
            ),
            flex: 5,
          ),
          BottomButton(
              onPress: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => InputPage(),
                  ),
                );
              },
              lable: 'RE-CALCULATE'),
        ],
      ),
    );
  }
}
