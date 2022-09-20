import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class PokeballWidget extends StatelessWidget {
  const PokeballWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: -60,
      top: -15,
      child: Image.asset('contents/images/pokeball.png', width: 210, color: Colors.grey.shade400,),
    );

  }
}