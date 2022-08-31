// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, unused_local_variable, prefer_const_declarations, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:pokedex/models/json/pokemon_json_model.dart';
import 'package:pokedex/provider/pokemon_provider.dart';
import 'package:pokedex/screens/home/widget/pokeball_widget.dart';
import 'package:provider/provider.dart';
import '../../../constants/images.dart';
import 'cached_network_image.dart';

class CardPokemonWidget extends StatelessWidget {
  CardPokemonWidget(this.pokemon, {Key? key} ) : super(key: key);
  final PokemonJson pokemon;

  @override
  Widget build(BuildContext context) {

    var theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Provider.of<PokemonProvider>(context, listen: false).getColor(pokemon.typeofpokemon[0]),
        ),
        child: Stack(
          children: [
            nameWidget(theme),
            typesWidget(theme),
            PokeballHomeWidget(),
            imageWidget()
          ],
        )
      ),
    );
  }

  Widget imageWidget() {
    final ImageProvider placeholder = AppImages.bulbasaur;

    const Size cacheMaxSize = Size(700, 700);
    return Positioned(
      right: 0,
      bottom: 0,
      child: Container(
        width: 100,
        child: Hero(
          tag: pokemon.id,
          child: CachedNetworkImageWidget(pokemon: pokemon))),
      
    );
  }

  Widget typesWidget(theme) {
    return Positioned(
      top: 50,
      left: 10,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for(var i=0; i<pokemon.typeofpokemon.length; i++) 
          Padding(
            padding: const EdgeInsets.all(2.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.black45
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
                child: Text(pokemon.typeofpokemon[i], style: theme.textTheme.subtitle1),
              )
            ),
          ),
        ],
      )
    );
  }

  Widget nameWidget(theme) {
    return Positioned(
      left: 10,
      top: 15,
      child: Text(pokemon.name, style: theme.textTheme.labelMedium),
    );
  }
}

