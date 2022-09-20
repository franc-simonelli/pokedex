// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, sort_child_properties_last, sized_box_for_whitespace, unnecessary_new, prefer_final_fields, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:pokedex/screens/details/info_base_pokemon.dart';
import 'package:pokedex/screens/details/pokeball_widget.dart';
import 'package:pokedex/widget/add_preferiti_widget.dart';
import 'package:provider/provider.dart';
import '../../models/arguments_route_details.dart';
import '../../provider/pokemon_provider.dart';
import 'container_information.dart';
import 'pokemon_inherited_widget.dart';

class DetailsScreen extends StatefulWidget {
  static const String routeName = "/detailsPage";
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
    
    final args = ModalRoute.of(context)!.settings.arguments as ArgumentRoutesDetails;

    return Consumer<PokemonProvider>(builder: (ctx, provider, _) {
      return PokemonAnimationInherited(
        slideController: _slideController,
        child: Scaffold(
          backgroundColor: Provider.of<PokemonProvider>(context, listen: false).getColor(provider.dettaglioPokemon.typeofpokemon[0]),
          body: Stack(
            children: [
              iconWidget(),
              PokeballDetailWidget(),
              AddPreferitiWidget(provider.dettaglioPokemon),
              ContainerInformation(),
              InfoBase(provider, args.lista),
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
