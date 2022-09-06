// ignore_for_file: prefer_const_constructors, prefer_typing_uninitialized_variables, unused_local_variable
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../models/json/pokemon_json_model.dart';
import '../../../provider/pokemon_provider.dart';
import '../../home/widget/cached_network_image.dart';

class EvolutionTabWidget extends StatelessWidget {
  const EvolutionTabWidget(this.provider, {Key? key}) : super(key: key);
  final provider;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return SingleChildScrollView(
      child: Column(
        children: [
          provider.dettaglioPokemon.evolutions.length < 2
          ?
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Text("Questo pokemon non ha nessuna catena evolutiva.",),
          )
          :
          ListView.separated(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            separatorBuilder: (_, __) => Divider(height: 30, color: Colors.grey, indent: 20.0, endIndent: 20.0,),
            itemCount: provider.dettaglioPokemon.evolutions.length - 1,
            itemBuilder: (_, i) {
              return rawEvolution(provider, i, context);
            }
          ),
          // SizedBox(height: 100)
        ],
      ),
    );
  }

  Widget rawEvolution(provider, i, context) {
    var theme = Theme.of(context);
    PokemonJson currentPokemon = PokemonJson();
    PokemonJson nextPokemon = PokemonJson();
    if( provider.dettaglioPokemon.name == 'Eevee') {
      currentPokemon = provider.dettaglioPokemon;
      nextPokemon = Provider.of<PokemonProvider>(context, listen: false).getPokemonById(provider.dettaglioPokemon.evolutions[i+1]);
    }
    else{
      currentPokemon = Provider.of<PokemonProvider>(context, listen: false).getPokemonById(provider.dettaglioPokemon.evolutions[i]);
      nextPokemon = Provider.of<PokemonProvider>(context, listen: false).getPokemonById(provider.dettaglioPokemon.evolutions[i+1]);
    }
    
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 2,
            child: Center(
              child: Stack(
                children: [
                  Image.asset('contents/images/pokeball.png', width: 100, color: theme.splashColor,),
                  CachedNetworkImageWidget(pokemon: currentPokemon),
                ],
              ),
            ),
          ),
          Expanded(flex: 3, child: Center(child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(nextPokemon.reason),
          ))),
          Expanded(
            flex: 2,
            child: Center(
              child: Stack(
                children: [
                  Image.asset('contents/images/pokeball.png', width: 100, color: theme.splashColor),
                  CachedNetworkImageWidget(pokemon: nextPokemon),
                ],
              ),
            ),
          ),
          
        ],
      ),
    );
  }
}