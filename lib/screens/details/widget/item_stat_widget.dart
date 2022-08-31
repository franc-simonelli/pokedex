// ignore_for_file: use_key_in_widget_constructors, avoid_unnecessary_containers, prefer_const_constructors

import 'package:flutter/material.dart';

class ItemStatWidget extends StatelessWidget {
  const ItemStatWidget({
    required this.stats, 
    required this.value, 
    required this.animation, 
    this.progress,
});
  
  final String stats;
  final int value;
  final Animation animation;
  final double? progress;


  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Row(
      children: [
        Expanded(
          flex: 2, 
          child: Container(
            child: Text(stats, style: theme.textTheme.bodyText2!.copyWith(fontWeight: FontWeight.bold),),
          ),
        ),
        Expanded(
          flex: 1, 
          child: Container(
            // color: Colors.green,
            child: Text(value.toString(), style: theme.textTheme.bodyText1!.copyWith(fontWeight: FontWeight.bold),)
          ),
        ),
        Expanded(
          flex: 5, 
          child: calculateBarStatsWidget(stats, value.toDouble()),
        )
      ],
    );
  }

  Widget calculateBarStatsWidget(stats, value) {
    if(value > 170) {
      value = (value * 220) / 720;
    }
    return Stack(
      children: [
        Container(
          width: 220,
          height: 25,
          decoration: BoxDecoration(
            color: calculateColor(stats),
          ),
        ),
        Positioned(
          left: 0,
          top: 1,
          bottom: 1,
          child: AnimatedContainer(
            duration: Duration(milliseconds: 300),
            height: 25,
            width: value,
            decoration: BoxDecoration(
              color: calculateColorValue(stats),
              borderRadius: BorderRadius.only(topRight: Radius.circular(20), bottomRight: Radius.circular(20))
            ),
          ),
        ),
      ]
    );
  }

  calculateColor(stats) {
    switch(stats) {
      case 'Hp':
        return Colors.green.shade200;
      case 'Attack':
        return Colors.yellow.shade200;
      case 'Defense':
        return Colors.orange.shade200;
      case 'Sp. Atk':
        return Colors.lightBlue.shade200;
      case 'Sp. Def':
        return Colors.blueGrey.shade200;
      case 'Speed':
        return Colors.purple.shade200;
      case 'Total':
        return Colors.grey.shade200;
    }
  }
  calculateColorValue(stats) {
    switch(stats) {
      case 'Hp':
        return Colors.green.shade700;
      case 'Attack':
        return Colors.yellow.shade700;
      case 'Defense':
        return Colors.orange.shade700;
      case 'Sp. Atk':
        return Colors.lightBlue.shade700;
      case 'Sp. Def':
        return Colors.blueGrey.shade700;
      case 'Speed':
        return Colors.purple.shade700;
      case 'Total':
        return Colors.grey.shade700;
    }
  }
}