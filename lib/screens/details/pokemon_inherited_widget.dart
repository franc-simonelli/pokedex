// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';

class PokemonAnimationInherited extends InheritedWidget {
  final AnimationController slideController;
  PokemonAnimationInherited(
    {
      Key? key, 
      required Widget child,
      required this.slideController
    }) : super(key: key, child: child);


  static PokemonAnimationInherited? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<PokemonAnimationInherited>();
  }

  @override
  bool updateShouldNotify(PokemonAnimationInherited oldWidget) {
    return false;
  }
}