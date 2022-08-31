// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:pokedex/screens/home/widget/pokedex_screen.dart';
import 'package:provider/provider.dart';
import '../../provider/pokemon_provider.dart';
import '../../widget/download_loading_widget.dart';
import '../fab/fab_menu.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Provider.of<PokemonProvider>(context, listen: false).remove();
    Provider.of<PokemonProvider>(context, listen: false).initPokemon(context);
    
    return Scaffold(
      body: Consumer<PokemonProvider>(builder: (ctx, provider, _) {
        return provider.isDownload
        ?
        DonwloadLoadingWidget()
        :
        Stack(
          children: [
            PokedexScreen(),
            FabMenu(),
          ]
        );
        
        // return DonwloadLoadingWidget();
        
        
      }),
    );
  }
}






