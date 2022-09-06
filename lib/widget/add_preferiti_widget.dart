// ignore_for_file: prefer_typing_uninitialized_variables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/json/pokemon_json_model.dart';
import '../provider/pokemon_provider.dart';

class AddPreferitiWidget extends StatefulWidget {
  const AddPreferitiWidget(this.pokemon, {Key? key}) : super(key: key);

  final pokemon;

  @override
  State<AddPreferitiWidget> createState() => _AddPreferitiWidgetState();
}

class _AddPreferitiWidgetState extends State<AddPreferitiWidget> with TickerProviderStateMixin {

  bool isPreferito = false;
  late AnimationController _controller;
  late Animation _sizeAnimation;

  @override
  void initState() {  
    _controller = AnimationController(duration: Duration(milliseconds: 300), vsync: this);
    _sizeAnimation = Tween<double>(begin: 40.0, end: 50.0).animate(CurvedAnimation(parent: _controller, curve: Curves.bounceInOut));
    _controller.addListener(() {
    setState(() {});
    });

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }


  checkPreferito() async {
    final prefs = await SharedPreferences.getInstance();
    final String preferiti = prefs.getString('preferiti') ?? '';
    List<PokemonJson> listaPreferiti = [];

    if(preferiti != '') {
      listaPreferiti = PokemonJson.decode(preferiti);

      for(var i in listaPreferiti) {
        if(i.numberPokedex == widget.pokemon.numberPokedex) {
          setState(() {
            isPreferito = true;
          });
          break;
        } else {
          setState(() {
            isPreferito = false;
          });
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {

    checkPreferito();
    
    return Positioned(
      top: 53,
      right: 30,
      child: GestureDetector(
        onTap: () async {
          Provider.of<PokemonProvider>(context, listen: false).addPreferito(widget.pokemon);
          await _controller.forward();
          _controller.reverse();
        },
        child: Icon(
          Icons.favorite, 
          color: isPreferito ? Colors.red : Colors.grey, 
          size: _sizeAnimation.value,
        )
      ),
    );
  }
}