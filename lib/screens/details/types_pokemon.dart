// ignore_for_file: prefer_typing_uninitialized_variables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'pokemon_inherited_widget.dart';

class TypesPokemon extends StatefulWidget {
  const TypesPokemon(this.provider, {Key? key}) : super(key: key);
  final provider;
  @override
  State<TypesPokemon> createState() => _TypesPokemonState();
}

class _TypesPokemonState extends State<TypesPokemon> {
  AnimationController get slideController => PokemonAnimationInherited.of(context)!.slideController;
  Animation<double> get textFadeAnimation => Tween(begin: 1.0, end: 0.0).animate(slideController);


  @override
  void initState() {
    // _animation = Tween<double>(begin: 1.0, end: 0.0).animate(slideController);
    super.initState();
  }
   
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: slideController,
      builder: ((context, child) {
      return  Positioned(
        top: 140,
        left: 25,
        child: IgnorePointer(
          ignoring: textFadeAnimation.value < 1,
          child: Opacity(
            opacity: textFadeAnimation.value,
            child: Row(
              children: [
                for(var i=0; i<widget.provider.dettaglioPokemon.typeofpokemon.length; i++)
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.black26
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 5),
                      child: Text(widget.provider.dettaglioPokemon.typeofpokemon[i], style: TextStyle(color: Colors.white),),
                    )
                  ),
                ),
              ]
            ),
          ),
        )
      );
    }));
  }
}