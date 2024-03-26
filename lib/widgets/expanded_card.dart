import 'package:flutter/material.dart';

class ExpandedCard extends StatelessWidget {
  const ExpandedCard({required this.color, this.cardChild, this.onPress});

  final Color color;
  final Widget? cardChild;
  final VoidCallback? onPress;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onPress,
        child: Container(
          //onTap: onPress,
          margin: EdgeInsets.all(15.0),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: cardChild,
        ),
      ),
    );
  }
}
