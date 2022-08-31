// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:pokedex/models/pokemon_types.dart';
import 'package:provider/provider.dart';

import '../../../provider/pokemon_provider.dart';
import 'item_stat_widget.dart';

class StatsTabWidget extends StatelessWidget {
  const StatsTabWidget(this.provider, this.progressAnimation, {Key? key}) : super(key: key);

  final PokemonProvider provider;
  final progressAnimation;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);     
    return Column(
       children: [
        Padding(
          padding: EdgeInsets.only(top: 25,left: 25, right: 25),
          child: Column(
            children: [
              ItemStatWidget(stats: "Hp", value: provider.dettaglioPokemon.hp, animation: progressAnimation,),
              SizedBox(height: 10),
              ItemStatWidget(stats: "Attack", value: provider.dettaglioPokemon.attack, animation: progressAnimation),
              SizedBox(height: 10),
              ItemStatWidget(stats: "Defense", value: provider.dettaglioPokemon.defense, animation: progressAnimation),
              SizedBox(height: 10),
              ItemStatWidget(stats: "Sp. Atk", value: provider.dettaglioPokemon.special_attack, animation: progressAnimation),
              SizedBox(height: 10),
              ItemStatWidget(stats: "Sp. Def", value: provider.dettaglioPokemon.special_defense, animation: progressAnimation),
              SizedBox(height: 10),
              ItemStatWidget(stats: "Speed", value: provider.dettaglioPokemon.speed, animation: progressAnimation),
              SizedBox(height: 10),
              ItemStatWidget(stats: "Total", value: provider.dettaglioPokemon.total, animation: progressAnimation, progress: provider.dettaglioPokemon.total/680),          
            ],
          ),
        ),
        SizedBox(height: 20,),

        // Padding(
        //   padding: EdgeInsets.only(top: 25,left: 25, right: 25),
        //   child: Wrap(
        //     spacing: 20,
        //     runSpacing: 10,
        //     children: types.map((e) => 
        //       Container(
        //         decoration: BoxDecoration(
        //           borderRadius: BorderRadius.circular(10),
        //           color: Provider.of<PokemonProvider>(context, listen: false).getColor(e),
        //         ),
                
        //         child: Container(
        //           width: 70,
        //           height: 25,
        //           decoration: BoxDecoration(
        //             borderRadius: BorderRadius.circular(10),
        //             color: Colors.black26
        //           ),
        //           child: Row(
        //             children: [
        //               Text(e, style: theme.textTheme.subtitle1!.copyWith(color: Colors.white, fontWeight: FontWeight.bold ),),
        //             ],
        //           ),
        //         ),
        //       )
        //     ).toList()
        //   ),
        // )
      ],
    );
  }    
}