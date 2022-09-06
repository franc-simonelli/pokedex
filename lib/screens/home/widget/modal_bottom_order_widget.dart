// ignore_for_file: prefer_const_constructors, prefer_typing_uninitialized_variables, unused_local_variable, no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../provider/modal_provider.dart';
import '../../../utils/theme.dart';

enum SingingCharacter { pokedex, hp, attack, defense, spAtk, spDef, speed, total }

class ModalBottomOrderWidget extends StatelessWidget {
  const ModalBottomOrderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return  Consumer<ModalProvider>(builder: (ctx, provider, _) {
      return Container(
        height: 650,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          color: theme.primaryColor,
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Column(
              children:[
                  
                SizedBox(height: 30),
                Row(
                  children: [
                    Text('Order Pokemon!', style: theme.textTheme.headline2),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text('Decresc.', style: theme.textTheme.subtitle2),
                    Switch(
                      activeColor: theme.splashColor,
                      activeTrackColor: Colors.grey,
                      inactiveThumbColor: theme.splashColor,
                      inactiveTrackColor: Colors.grey,
                      value: provider.crescente, 
                      onChanged: ((value) => {
                        Provider.of<ModalProvider>(context, listen: false).setCrescenteDecrescente(context)
                      }),
                    ),
                    Text('Cresc.', style: theme.textTheme.subtitle2),
                  ],
                ),
                SizedBox(height: 20),
                TileDrawerWidget(theme, 'N° Pokedex', provider,),
                TileDrawerWidget(theme, 'Hp', provider,),
                TileDrawerWidget(theme, 'Attack', provider,),
                TileDrawerWidget(theme, 'Defense', provider,),
                TileDrawerWidget(theme, 'Sp.Atk', provider,),
                TileDrawerWidget(theme, 'Sp.Def', provider,),
                TileDrawerWidget(theme, 'Speed', provider,),
                TileDrawerWidget(theme, 'Total', provider,),
              ],
            ),
          ),
        ),
      );
    });
  }
}

class TileDrawerWidget extends StatelessWidget {
  const TileDrawerWidget(this.theme, this.order, this.provider,{Key? key}) : super(key: key);
  final order;
  final theme;
  final ModalProvider provider;

  @override
  Widget build(BuildContext context) {
    SingingCharacter? _character = SingingCharacter.pokedex;

    return ListTile(
      leading: InkWell(
        splashColor: Theme.of(context).primaryColor,
        onTap: () {Provider.of<ModalProvider>(context, listen: false).setOrderBy(order, context);},
        child: Container(
          width: 20,
          height: 20,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Theme.of(context).primaryColor,
            boxShadow: MediaQuery.platformBrightnessOf(context) == Brightness.dark ? MyTheme.shadowButtonDrawerDark : MyTheme.shadowButtonDrawerLight
          ),
          child: provider.orderBy == order 
          ?
          Center(
            child: Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.black
              ),
            ),
          )
          :
          Container()
          ,
        ),
      ),
      title: Text(order, style: theme.textTheme.subtitle2,),
    );
  }
}