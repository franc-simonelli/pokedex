// ignore_for_file: prefer_const_constructors, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class CheckBoxWidget extends StatelessWidget {
  const CheckBoxWidget(this.check, {
    Key? key,
  }) : super(key: key);
  final check;
  @override
  Widget build(BuildContext context) {
    
    return Container(
      width: 25,
      height: 25,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: MediaQuery.platformBrightnessOf(context) == Brightness.light ? 
            Colors.grey.shade200 : Colors.grey.shade900,
        boxShadow: [
          BoxShadow(
            spreadRadius: 1,
            blurRadius: 1,
            offset: Offset(-1, -1),
            color: MediaQuery.platformBrightnessOf(context) == Brightness.light ? Colors.white : Colors.grey.shade800
          ),
          BoxShadow(
            spreadRadius: 1,
            blurRadius: 1,
            offset: Offset(1, 1),
            color: MediaQuery.platformBrightnessOf(context) == Brightness.light ? Colors.grey.shade400 : Colors.black
          )
        ]  
      ),
      child: Center(
        child: check? 
          Icon(
            Icons.check, 
            color: Colors.grey.shade600,)
          :Container(),
      ),
    );
  }
}
