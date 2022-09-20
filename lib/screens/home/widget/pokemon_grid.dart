// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:pokedex/models/arguments_route_details.dart';
import 'package:pokedex/screens/details/detail_page_screen.dart';
import 'package:provider/provider.dart';
import '../../../../provider/pokemon_provider.dart';
import '../../../utils/routes.dart';
import 'card_pokemon_widget.dart';

class PokemonGrid extends StatelessWidget {
  const PokemonGrid(this.lista, {
    Key? key,
  }) : super(key: key);

  final lista;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 1.4
      ),
      itemCount: lista.length,
      itemBuilder: (BuildContext context, int i) {
          
        return InkWell(
          onTap: () {
            Provider.of<PokemonProvider>(context, listen: false).selectPokemon(lista[i]);
            Navigator.pushNamed(context, DetailsScreen.routeName, arguments: ArgumentRoutesDetails(lista));
          },
          child: CardPokemonWidget(lista[i])
        );
      }
    );
  }
}
