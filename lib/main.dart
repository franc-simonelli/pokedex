// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:pokedex/provider/modal_provider.dart';
import 'package:pokedex/provider/pokemon_provider.dart';
import 'package:pokedex/provider/progress_bar_provider.dart';
import 'package:pokedex/services/pokemon_service.dart';
import 'package:pokedex/utils/theme.dart';
import 'package:provider/provider.dart';
import 'data/map_pokemon_data.dart';
import 'screens/home/home_page_screen.dart';
import 'services/http_service.dart';
import 'utils/routes.dart';

void main() {

  ModuleContainer().initialise(Injector());

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => PokemonProvider(),),
        ChangeNotifierProvider(create: (_) => ModalProvider(),),
        ChangeNotifierProvider(create: (_) => ProgressBarProvider(),),
      ],
      child: MyApp(),
    ),
  );

  
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: MyTheme.lightTheme,
      darkTheme: MyTheme.darkTheme,
      home: HomePageScreen(),
      onGenerateRoute: AppNavigator.onGenerateRoute,
      navigatorKey: AppNavigator.navigatorKey,
    
    );
  }
}

class ModuleContainer {
  Injector initialise(Injector injector) {
    injector.map<HttpService>((i) => HttpService(), isSingleton: false);
    injector.map<PokemonService>((i) => PokemonService(), isSingleton: false);
    injector.map<MapPokemonData>((i) => MapPokemonData(), isSingleton: false);

    return injector;
  }
}



