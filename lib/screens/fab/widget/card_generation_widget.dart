import 'package:flutter/material.dart';

import '../../../models/generation.dart';

class CardGeneration extends StatelessWidget {
  const CardGeneration(this.generation, {Key? key}) : super(key: key);
  final Generation generation;
  @override
  Widget build(BuildContext context) {
    var theme  =Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(10)
      ),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(generation.title, style: theme.textTheme.subtitle1,)
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: generation.pokemons
              .map((e) => Image.asset(e, width: 50, height: 50)).toList()
          )
        ],
      ),
    );
  }
}