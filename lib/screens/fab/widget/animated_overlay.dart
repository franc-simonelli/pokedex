// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';

class AnimatedOverlay extends AnimatedWidget {
  final Color color;
  final Widget? child;
  final void Function()? onPress;

  AnimatedOverlay({
    required Animation animation,
    required this.color,
    this.child,
    this.onPress,
  }) : super(listenable: animation);

  Animation<double> get animation => listenable as Animation<double>;

  @override
  Widget build(BuildContext context) {
    return Stack(
      // fit: StackFit.expand,
      children: [
        IgnorePointer(
          ignoring: animation.value == 0,
          child: InkWell(
            onTap: onPress,
            child: Container(
              // width: MediaQuery.of(context).size.width + 10,
              color: color.withOpacity(animation.value * 0.5),
            ),
          ),
        ),
        if (child != null) child!,
      ],
    );
  }
}
