import 'package:bmi_calculator_flutter/packages/bmi_calculator.dart';
import 'package:bmi_calculator_flutter/pages/results_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../constants/constands.dart';
import '../widgets/bottom_button.dart';
import '../widgets/expanded_card.dart';
import '../widgets/icon_content.dart';
import '../widgets/round_icon_button.dart';

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

enum Gendar { male, female, unknown }

class _InputPageState extends State<InputPage> {
  late Gendar selectedGendar = Gendar.unknown;
  int height = 170;
  int weight = 75;
  int age = 40;
  int bmi = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(appTitle),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Row(
                children: [
                  ExpandedCard(
                    color: selectedGendar == Gendar.male
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    onPress: () {
                      setState(() {
                        selectedGendar = Gendar.male;
                      });
                    },
                    cardChild: IconContent(
                      icon: FontAwesomeIcons.mars,
                      label: 'MALE',
                    ),
                  ),
                  ExpandedCard(
                    color: selectedGendar == Gendar.female
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    onPress: () {
                      setState(() {
                        selectedGendar = Gendar.female;
                      });
                    },
                    cardChild: IconContent(
                      icon: FontAwesomeIcons.venus,
                      label: 'FEMALE',
                    ),
                  )
                ],
              ),
            ),
            ExpandedCard(
              color: kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'HEIGHT',
                    style: kLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    textBaseline: TextBaseline.ideographic,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    children: [
                      Text(
                        height.toString(),
                        style: kNumberTextStyle,
                      ),
                      Text(
                        'CM',
                        style: kLabelTextStyle,
                      ),
                    ],
                  ),
                  Slider(
                    value: height.toDouble(),
                    min: 120.0,
                    max: 220.0,
                    onChanged: (double value) {
                      setState(() {
                        height = value.round();
                      });
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  ExpandedCard(
                    color: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'WEIGHT',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPress: () {
                                setState(() {
                                  weight = weight - 1;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPress: () {
                                setState(() {
                                  weight = weight + 1;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  ExpandedCard(
                    color: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'AGE',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPress: () {
                                setState(() {
                                  age = age - 1;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPress: () {
                                setState(() {
                                  age = age + 1;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            BottomButton(
              lable: 'CALCULATE BMI',
              onPress: () {
                BmiCalculator calc =
                    BmiCalculator(height: height, weight: weight);

                final r = calc.getResult();
                final i = calc.getInterpretation();
                final b = calc.getBmi();

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        ResultsPage(result: r, interpretation: i, bmi: b),
                  ),
                );
              },
            )
          ],
        ));
  }
}
