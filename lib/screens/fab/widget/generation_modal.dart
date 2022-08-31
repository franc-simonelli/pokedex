// ignore_for_file: prefer_const_constructors, unused_local_variable

import 'package:flutter/material.dart';
import 'package:pokedex/provider/pokemon_provider.dart';
import 'package:pokedex/screens/fab/widget/modal_widget.dart';
import 'package:provider/provider.dart';
import '../../../constants/generations.dart';
import '../../../models/pokemon_types.dart';
import 'card_generation_widget.dart';

class GenerationModal extends StatelessWidget {
  const GenerationModal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final safeAreaBottom = MediaQuery.of(context).padding.bottom;
    var theme = Theme.of(context);

    return DraggableScrollableSheet(
      expand: true,
      initialChildSize: 0.7,
      maxChildSize: 1.0,
      minChildSize: 0.5,
      builder: (_, scrollController) {
        return ModalWidget(
          title: Text('Generations', style: theme.textTheme.subtitle2!.copyWith(fontSize: 20, fontWeight: FontWeight.bold)), 
          child: gridGeneration(safeAreaBottom, scrollController, context)
        ) ;
      }
    );      
  }

  Widget gridGeneration(double safeAreaBottom, ScrollController scrollController, context) {
    
    return Expanded(
      child: GridView.builder(
        padding: EdgeInsets.fromLTRB(26, 26, 26, 26 + safeAreaBottom),
        controller: scrollController,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.55,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: generations.length,
        itemBuilder: (_, i) {
          return InkWell(
            onTap: () {
              Provider.of<PokemonProvider>(context, listen: false).changeGeneration(generations[i].title);
              Navigator.of(context).pop();
            },
            child: CardGeneration(generations[i])
          );
        },
      ),
    );
  }
}

