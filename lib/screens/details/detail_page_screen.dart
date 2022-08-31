// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, sort_child_properties_last, sized_box_for_whitespace, unnecessary_new, prefer_final_fields, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:pokedex/screens/details/info_base_pokemon.dart';
import 'package:pokedex/screens/details/pokeball_widget.dart';
import 'package:provider/provider.dart';
import '../../provider/pokemon_provider.dart';
import 'container_information.dart';
import 'pokemon_inherited_widget.dart';

class DetailsScreen extends StatefulWidget {
  DetailsScreen({Key? key}) : super(key: key);

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> with TickerProviderStateMixin {
  late AnimationController _slideController;

  @override
  void initState() {
    _slideController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 100),
    );

    super.initState();
  }
  
  @override
  void dispose() {
     _slideController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<PokemonProvider>(builder: (ctx, provider, _) {
      return PokemonAnimationInherited(
        slideController: _slideController,
        child: Scaffold(
          backgroundColor: Provider.of<PokemonProvider>(context, listen: false).getColor(provider.dettaglioPokemon.typeofpokemon[0]),
          body: Stack(
            children: [
              iconWidget(),
              PokeballDetailWidget(),
              ContainerInformation(),
              InfoBase(provider),
            ]
          )
        ),
      );
    });
    
  }

  Widget iconWidget() {
    return Positioned(
      top: 60,
      left: 20,
      child: InkWell(
        onTap: () {Navigator.of(context).pop();},
        child: Icon(Icons.arrow_back_ios, color:  Colors.white,)
      ),
    );
  }

}
