import 'package:flutter/material.dart';

import 'pages/input_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  const BMICalculator({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        sliderTheme: SliderTheme.of(context).copyWith(
          trackHeight: 1.0,
          inactiveTrackColor: Color(0xFF8D8E98),
          activeTrackColor: Colors.white,
          thumbColor: Color(0xFFE81555),
          overlayColor: Color(0x40E81555),
          thumbShape: RoundSliderThumbShape(enabledThumbRadius: 10.0),
          overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
        ),
        scaffoldBackgroundColor: Color(0xFF0A0E21),
        primaryColor: Color(0xFF0A0E21),
      ),
      home: InputPage(),
    );
  }
}
