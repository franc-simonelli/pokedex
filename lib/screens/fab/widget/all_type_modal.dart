// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:pokedex/models/pokeapi/pokemon_model.dart';
import 'package:pokedex/screens/fab/widget/modal_widget.dart';
import 'package:provider/provider.dart';

import '../../../models/pokemon_types.dart';
import '../../../provider/modal_provider.dart';
import '../../../provider/pokemon_provider.dart';
import '../../home/widget/checkbox_widget.dart';
import 'type_widget.dart';

class AllTypeModal extends StatelessWidget {
  const AllTypeModal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Consumer<PokemonProvider>(builder: (ctx, provider, _) {
      return DraggableScrollableSheet(
        expand: true,
        initialChildSize: 0.8,
        maxChildSize: 1.0,
        minChildSize: 0.5,
        builder: (_, scrollController) {
          return ModalWidget(
            title: titleWidget(theme, provider, context), 
            child: gridWidget(scrollController, context, provider, theme)
          );
        }
      );
    });      
  }

  Widget gridWidget(ScrollController scrollController, BuildContext context, PokemonProvider provider, ThemeData theme) {
    return Expanded(
      child: GridView.builder(
        shrinkWrap: true,
        padding: EdgeInsets.fromLTRB(26, 26, 26, 50),
        // physics: NeverScrollableScrollPhysics(),
        controller: scrollController,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 1,
          crossAxisSpacing: 15,
          mainAxisSpacing: 15,
        ),
        itemCount: types.length,
        itemBuilder: (_, i) {
          return InkWell(
            onTap: () {
              Provider.of<PokemonProvider>(context, listen: false).setTypeFilter(types[i], context);
            },
            child: TypeWidget(provider, types[i])
          );
        },
      ),

    );
  }

  Widget titleWidget(ThemeData theme, PokemonProvider provider, context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        InkWell(
          onTap: () {Provider.of<ModalProvider>(context, listen: false).setCheckSearchTypes(context);},
          child: Row(
            children: [
              Consumer<ModalProvider>(builder: (ctx, provider, _) {
                return CheckBoxWidget(provider.checkSearchTypes);
              }),
              SizedBox(width: 10,),
              Text("Search in all generations")
            ]
          ),
        ),
        // Text('Types', style: theme.textTheme.subtitle2!.copyWith(fontSize: 20, fontWeight: FontWeight.bold)), 
        removeAllWidget(provider)
      ],
    );
  }

  Widget removeAllWidget(PokemonProvider provider) {
    return Opacity(
      opacity: provider.checkButtonRemoveAll() ? 1 : 0.2,
      child: InkWell(
        onTap:() { provider.removeAllTypeFilter(); },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.grey)
          ),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Text('Remove all'),
          )
        ),
      ),
    );
  }

}



