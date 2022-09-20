// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:pokedex/provider/modal_provider.dart';
import 'package:pokedex/provider/pokemon_provider.dart';
import 'package:pokedex/provider/progress_bar_provider.dart';
import 'package:pokedex/screens/preferiti/preferiti_screen.dart';
import 'package:pokedex/services/pokemon_service.dart';
import 'package:pokedex/utils/theme.dart';
import 'package:provider/provider.dart';
import 'data/map_pokemon_data.dart';
import 'screens/details/detail_page_screen.dart';
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

  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.transparent
    )
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
      // home: HomePageScreen(),
      // onGenerateRoute: AppNavigator.onGenerateRoute,
      // navigatorKey: AppNavigator.navigatorKey,
      initialRoute: HomePageScreen.routeName,
      routes: createRoutes(),
    
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

Map<String, Widget Function(BuildContext)> createRoutes() {
  return {
    HomePageScreen.routeName: (ctx) => HomePageScreen(),  
    PreferitiScreen.routeName: (ctx) => PreferitiScreen(),
    DetailsScreen.routeName: (ctx) => DetailsScreen()
  };
}



