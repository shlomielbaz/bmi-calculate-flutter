import 'package:flutter/material.dart';

import '../constants/constands.dart';

class BottomButton extends StatelessWidget {
  const BottomButton({
    super.key,
    required this.onPress,
    required this.lable,
  });

  final VoidCallback onPress;
  final String lable;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        color: kBottomContainerColor,
        margin: EdgeInsets.only(top: 10.0),
        padding: EdgeInsets.only(bottom: 20.0),
        height: kBottomContainerHeight,
        width: double.infinity,
        child: Center(
            child: Text(
          lable,
          style: kLargeButtonTextStyle,
        )),
      ),
    );
  }
}
