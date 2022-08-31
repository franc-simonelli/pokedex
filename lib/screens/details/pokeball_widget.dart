// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class PokeballDetailWidget extends StatefulWidget {
  const PokeballDetailWidget({Key? key}) : super(key: key);

  @override
  State<PokeballDetailWidget> createState() => _PokeballDetailWidgetState();
}

class _PokeballDetailWidgetState extends State<PokeballDetailWidget> with TickerProviderStateMixin{
  late AnimationController _rotateController;
  @override
  void initState() {
    _rotateController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 5000),
    )..repeat();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: -50,
      top: -30,
      child: RotationTransition(
        turns: _rotateController,
        child: Image.asset('contents/images/pokeball.png', width: 200, color: Colors.grey.shade400,)
      ),
    );
  }
}