// ignore_for_file: prefer_const_constructors, unused_local_variable, no_leading_underscores_for_local_identifiers, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:pokedex/provider/modal_provider.dart';
import 'package:pokedex/utils/theme.dart';
import 'package:pokedex/widget/pokeball_widget.dart';
import 'package:provider/provider.dart';
import '../../../provider/pokemon_provider.dart';
import '../../../widget/drawer_widget.dart';
import '../../../widget/filter_types_widget.dart';
import '../../../widget/filter_widget.dart';
import '../../../widget/icon_filter.dart';
import '../../../widget/title_widget.dart';
import 'modal_bottom_order_widget.dart';
import 'pokemon_grid.dart';

class PokedexScreen extends StatelessWidget {
  const PokedexScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var theme  =Theme.of(context);
    final GlobalKey<ScaffoldState> _drawerKey = GlobalKey<ScaffoldState>();
    
    return Consumer2<PokemonProvider, ModalProvider>(builder: (ctx, provider, modalProvider, _) {
      return Scaffold(
        key: modalProvider.drawer,
        body: Stack(
          children: [
            PokeballWidget(),
            TitleWidget('Pokedex'), 
            IconFilterWidget(),
            provider.filterSearch != ''
            ?
            FilterWidget(provider)
            :
            provider.typeFilter.isNotEmpty 
            ?
            FilterTypesWidget(provider)
            :
            Container(), 
            Positioned(
              // top: provider.filterSearch == '' || provider.typeFilter.isEmpty ? 120 : 150,
              top: 150,
              bottom: 0,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Consumer<PokemonProvider>(builder: (ctx, provider, _) {
                    return provider.loading
                    ?
                    CircularProgressIndicator()
                    :
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 5, left: 5, right: 5),
                        child: PokemonGrid(provider.listaPokemon),
                      ),
                    );
                  })
                ],
              ),
            ),
          ],
        ),
        drawer: DrawerWidget()
      );
    });
  }

} 