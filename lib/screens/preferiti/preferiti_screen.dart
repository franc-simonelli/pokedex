import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

import '../../provider/modal_provider.dart';
import '../../provider/pokemon_provider.dart';
import '../../widget/drawer_widget.dart';
import '../../widget/filter_types_widget.dart';
import '../../widget/filter_widget.dart';
import '../../widget/icon_filter.dart';
import '../../widget/pokeball_widget.dart';
import '../../widget/title_widget.dart';
import '../home/widget/pokemon_grid.dart';

class PreferitiScreen extends StatefulWidget {
  const PreferitiScreen({Key? key}) : super(key: key);
  static const String routeName = "/preferitiPage";

  @override
  State<PreferitiScreen> createState() => _PreferitiScreenState();
}

class _PreferitiScreenState extends State<PreferitiScreen> {

  @override
  void dispose() async {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    Provider.of<PokemonProvider>(context, listen: false).getPokemonPreferiti();

    return Consumer2<PokemonProvider, ModalProvider>(builder: (ctx, provider, modalProvider, _) {
      return Scaffold(
          body: Stack(
            children: [
              PokeballWidget(),
              TitleWidget('Preferiti'), 
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
                          child: PokemonGrid(provider.listaPokemonPreferiti),
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