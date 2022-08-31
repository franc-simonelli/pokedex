// ignore_for_file: prefer_const_constructors_in_immutables, use_key_in_widget_constructors

import 'package:flutter/material.dart';

class ProgressBar extends StatelessWidget {
  ProgressBar(
    {
      required this.width,
      required this.height,
      required this.progress,
      this.child
    }
  );

  final double width;
  final double height;
  final double progress;
  final child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: Colors.red.shade800)
          ),
        ),
        Container(
          height: height,
          width: progress,
          decoration: BoxDecoration(
            color: Colors.red.shade800,
            borderRadius: BorderRadius.circular(5)
          ),
        ),
        Positioned(
          left: 130,
          top: 10,
          child: Text(calculatePercent(progress, width) + ' %', style: const TextStyle(color: Colors.white),)
        ),
        child
      ]
    );
  }

  calculatePercent(progress, width) {
    var n = ((100 * progress) / width);
    var x = num.parse(n.toStringAsFixed(2));
    return x.toString();
  }
}