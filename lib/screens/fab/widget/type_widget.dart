// ignore_for_file: use_key_in_widget_constructors, prefer_typing_uninitialized_variables, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:pokedex/utils/theme.dart';
import 'package:provider/provider.dart';

import '../../../provider/pokemon_provider.dart';

class TypeWidget extends StatelessWidget {
  TypeWidget(this.provider, this.item);
  final item;
  final provider;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Opacity(
      opacity: provider.checkOpacityTypeFilter(item) ? 0.2 : 1.0,
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.grey.shade800, width: 3),
              color: Provider.of<PokemonProvider>(context, listen: false).getColor(item),
              boxShadow: MyTheme.shadowCardType
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              width: 110,
              height: 5,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5)
              )
            ),
          ),
          Align(
            alignment: Alignment.center,
              child: Container(
              width: 50,
              
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.grey.shade800, width: 2),
                color: Colors.black38
              ),
                                  ),
            ),        
          Align(
            alignment: Alignment.center,
            child: Container(
              width: 100,
              height: 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.grey.shade700, width: 1),
                color: Provider.of<PokemonProvider>(context, listen: false).getColor(item)
              ),
              child: Center(
                child: Text(
                  item, 
                  style: theme.textTheme.subtitle1!.copyWith(
                    fontSize: 20, 
                    shadows: MyTheme.shadowTextType
                  ), 
                ),
              ),
            ),
          )
          
        ],
      ),
    );
  }
}
