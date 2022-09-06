// ignore_for_file: prefer_typing_uninitialized_variables, avoid_unnecessary_containers, prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';
import '../../../utils/theme.dart';

class AboutTabWidget extends StatelessWidget {
  const AboutTabWidget(this.provider, {Key? key}) : super(key: key);

  final provider;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10,),
            Text(provider.dettaglioPokemon.xdescription, style: theme.textTheme.bodyText1,),
            SizedBox(height: 20,),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: theme.primaryColor,
                boxShadow: MediaQuery.platformBrightnessOf(context) == Brightness.light ?
                  MyTheme.shadowCardLight
                  :
                  MyTheme.shadowCardDark
                
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Text("Height", style: theme.textTheme.bodyText1!.copyWith(color: Colors.grey.shade600),),
                        SizedBox(height: 3,),
                        Text(
                          '${provider.dettaglioPokemon.height} m', 
                          style: theme.textTheme.bodyText1!.copyWith(fontWeight: FontWeight.bold),)
                      ],
                    ),
                    Column(
                      children: [
                        Text("Weight", style: theme.textTheme.bodyText1!.copyWith(color: Colors.grey.shade600)),
                        SizedBox(height: 3,),
                        Text('${provider.dettaglioPokemon.weight} kg', style: theme.textTheme.bodyText1!.copyWith(fontWeight: FontWeight.bold))
                      ],
                    ),
                    
                  ],
                ),
              ),
            ),
            SizedBox(height: 30,),
            Text("Breeding", style: theme.textTheme.headline2),
            SizedBox(height: 20,),
            Row(
              children: [
                Text("Gender", style: theme.textTheme.bodyText1!.copyWith(color: Colors.grey.shade600)),
                SizedBox(width: 20,),
                Icon(Icons.male_outlined, color: Colors.blue, size: 18,),
                provider.dettaglioPokemon.male_percentage != null? 
                Text(provider.dettaglioPokemon.male_percentage.toString(), style: theme.textTheme.bodyText1!.copyWith(fontWeight: FontWeight.bold)) 
                :
                Text('Unknow', style: theme.textTheme.bodyText1!.copyWith(fontWeight: FontWeight.bold)),
                SizedBox(width: 20,),
                Icon(Icons.female_outlined, color: Colors.pink, size: 18,),
                provider.dettaglioPokemon.female_percentage != null? 
                Text(provider.dettaglioPokemon.female_percentage.toString(), style: theme.textTheme.bodyText1!.copyWith(fontWeight: FontWeight.bold))
                :
                Text('Unknow', style: theme.textTheme.bodyText1!.copyWith(fontWeight: FontWeight.bold)),
              ],
            ),
            SizedBox(height: 5,),
            Row(
              children: [
                Text("Egg Groups", style: theme.textTheme.bodyText1!.copyWith(color: Colors.grey.shade600)),
                SizedBox(width: 20,),
                Text(provider.dettaglioPokemon.egg_groups, style: theme.textTheme.bodyText1!.copyWith(fontWeight: FontWeight.bold))
              ],
            ),
            SizedBox(height: 30,),
            Text("Abilities", style: theme.textTheme.headline2),
            SizedBox(height: 10,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: provider.dettaglioPokemon.abilitiesApi!.map((e) =>
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Container(
                  width: MediaQuery.of(context).size.width/2,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20, top: 10, right: 20, bottom: 10),
                    child: Row(
                      children: [
                        Expanded(child: Text(e.ability!.name!, style: theme.textTheme.bodyText1)),
                        Icon(Icons.arrow_drop_down, color: theme.splashColor, size: 25,)
                      ],
                    ),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: theme.splashColor)
                  ),
                ),
              )).toList()
              
            ),
            
            
          ],

        ),
      ),
    );
  }
}