// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, prefer_final_fields, unnecessary_new, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:pokedex/utils/theme.dart';
import 'package:provider/provider.dart';
import '../../../provider/pokemon_provider.dart';
import 'evolution_tab_widget.dart';
import 'stats_tab_widget.dart';

class TabBarInfoPokemon extends StatefulWidget {
  const TabBarInfoPokemon({
    Key? key,
  }) : super(key: key);

  @override
  State<TabBarInfoPokemon> createState() => _TabBarInfoPokemonState();
}

class _TabBarInfoPokemonState extends State<TabBarInfoPokemon> with TickerProviderStateMixin{
  late TabController _tabController = new TabController(initialIndex: 0, length: 3, vsync: this);
  late Animation<double> _progressAnimation;
  late AnimationController _progressController;

  @override
  void initState() {
    _progressController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000),
    );

    _progressAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
      curve: Curves.easeInOut,
      parent: _progressController,
    ));

    _progressController.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Consumer<PokemonProvider>(builder: (ctx, provider, _) {
      return Column(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 0, right: 0, top: 30),
            child: TabBar( 
              unselectedLabelColor: Colors.grey,
              labelColor: theme.splashColor,
              labelPadding: EdgeInsets.symmetric(vertical: 16),
              indicatorColor: theme.splashColor,
              indicatorWeight: 2.0,
              indicator: UnderlineTabIndicator(
                borderSide: BorderSide(width: 2.0, color: theme.splashColor),
                insets: EdgeInsets.symmetric(horizontal:30.0)
              ),
              tabs: [
                Tab(text: 'About' ),
                Tab(text: 'Base stats',),
                Tab(text: 'Evolution',),
                // Tab(text: 'Moves',),
              ],
              controller: _tabController,
            ),
          ),
          Expanded(
              child: TabBarView(
                children: [
                  aboutTabWidget(provider, theme, context),
                  // AboutTabWidget(provider),
                  StatsTabWidget(provider, _progressAnimation),
                  EvolutionTabWidget(provider),
                ],
                controller: _tabController,
              ),
            )
        ],
      );
    });
  }

  Widget aboutTabWidget(PokemonProvider provider, ThemeData theme, BuildContext context) {
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
