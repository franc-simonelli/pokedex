// ignore_for_file: prefer_const_constructors, unused_local_variable, no_leading_underscores_for_local_identifiers, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:pokedex/provider/modal_provider.dart';
import 'package:pokedex/utils/theme.dart';
import 'package:provider/provider.dart';
import '../../../provider/pokemon_provider.dart';
import '../../../widget/drawer_widget.dart';
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
            pokeballWidget(),
            titleWidget(theme), 
            iconFilter(theme, context),
            provider.filterSearch != ''
            ?
            filterWidget(provider, theme, context)
            :
            provider.typeFilter.isNotEmpty 
            ?
            filterTypesWidget(provider, theme, context)
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
                        child: PokemonGrid(provider),
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

  Widget filterWidget(PokemonProvider provider, ThemeData theme, BuildContext context) {
    return Positioned(
      top: 110,
      left: 20,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey)
        ),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Row(
            children: [
              Text('Result for: ${provider.filterSearch}', style: theme.textTheme.subtitle2),
              SizedBox(width: 10),
              InkWell(
                onTap: () {Provider.of<PokemonProvider>(context, listen: false).removeFilter(context);},
                child: Icon(Icons.close, color: Colors.grey,)
              )
            ],
          ),
        )
      ),
    );
  }

  Widget filterTypesWidget(PokemonProvider provider, ThemeData theme, BuildContext context) {
    
    return Positioned(
      top: 110,
      left: 20,
      right: 10,
      child: Row(
        children: [
          Text("Filter: ", style: theme.textTheme.subtitle2),
          Container(
            width: 310,
            height: 30,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: provider.typeFilter.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Provider.of<PokemonProvider>(context, listen: false).getColor(provider.typeFilter[index]),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Row(
                        children: [
                          Text(
                            provider.typeFilter[index], 
                            style: theme.textTheme.subtitle2!.copyWith(
                              color: Colors.white, 
                              shadows: MyTheme.shadowTextType
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10, ),
                            child: InkWell(
                              onTap: () { Provider.of<PokemonProvider>(context, listen: false).setTypeFilter(provider.typeFilter[index], context);},
                              child: Icon(Icons.close, color: Colors.white, shadows: MyTheme.shadowTextType,)),
                          )
                        ],
                      ),
                    )
                  ),
                ); 
              }
            )
          ),
        ],
      ),





    );
  }

  Widget titleWidget(ThemeData theme) {
    return Positioned(
      top: 60,
      left: 20,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          
        ),
        child: Padding(
          padding: const EdgeInsets.all(0.0),
          child: Text('Pokedex', style: theme.textTheme.headline1),
        )
      ),
    );
  }

  Widget iconFilter(ThemeData theme, context) {
    return Positioned(
      top: 70,
      right: 25,
      child: InkWell(
        // onTap: () {Provider.of<ModalProvider>(context, listen: false).onTappedBar();}
        child: Opacity(
          opacity: 1.0,
          child: Container(
            
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.grey.shade300,
            ),
            child: Padding(
              padding: const EdgeInsets.all(3),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text("Ordina", style: theme.textTheme.bodyLarge!.copyWith(color: Colors.grey.shade900, fontSize: 16)),
                  ),
                  Icon(Icons.swap_vert_outlined, color: Colors.black, size: 30,),
                ],
              ),
            ),
          ),
        ),
        onTap: () { 
          modalBottomOrder(context);
        } 
      ),
    );
  }

  Future<void> modalBottomOrder(context) {
    return showModalBottomSheet<void>(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      context: context,
      builder: (BuildContext context) {
        return ModalBottomOrderWidget();
      },
    );
  }

  Widget pokeballWidget() {
    return Positioned(
      right: -60,
      top: -15,
      child: Image.asset('contents/images/pokeball.png', width: 210, color: Colors.grey.shade400,),
    );
  }


} 