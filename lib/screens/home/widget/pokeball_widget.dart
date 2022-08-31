import 'package:flutter/material.dart';

class PokeballHomeWidget extends StatelessWidget {
  const PokeballHomeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: -5,
      bottom: -5,
      child: Image.asset('contents/images/pokeball.png', width: 100,),
    );
  }
}