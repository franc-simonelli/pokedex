// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../extensions/fade_page_route.dart';
import '../screens/details/detail_page_screen.dart';
import '../screens/home/home_page_screen.dart';
import '../screens/preferiti/preferiti_screen.dart';
import '../screens/splash_screen/splash_screen.dart';


// enum Routes { splash, home, pokedex, detailsPokemon, favoritePokemon }

// class _Paths {
//   static const String splash = '/';
//   static const String home = '/home';
//   static const String detailsPokemon = '/details/pokemon';
//   static const String favoritePokemon = '/favorite/pokemon';

//   static const Map<Routes, String> _pathMap = {
//     Routes.splash: _Paths.splash,
//     Routes.home: _Paths.home,
//     Routes.detailsPokemon: _Paths.detailsPokemon,
//     Routes.favoritePokemon: _Paths.favoritePokemon,
//   };

//   static String of(Routes route) => _pathMap[route] ?? splash;
// }

// class AppNavigator {
//   static GlobalKey<NavigatorState> navigatorKey = GlobalKey();


//   static Route onGenerateRoute(RouteSettings settings) {
//     switch (settings.name) {
//       case _Paths.favoritePokemon:
//         return FadeRoute(page: PreferitiScreen());

//       case _Paths.splash:
//         return FadeRoute(page: SplashScreen());

//       // case _Paths.detailsPokemon:
//       //   return FadeRoute(page: DetailsScreen());

//       case _Paths.home:
//       default:
//         return FadeRoute(page: HomePageScreen());
//     }
//   }

//   static Future? push<T>(Routes route, [T? arguments]) =>
//       state?.pushNamed(_Paths.of(route), arguments: arguments);

//   static Future? replaceWith<T>(Routes route, [T? arguments]) =>
//       state?.pushReplacementNamed(_Paths.of(route), arguments: arguments);

//   static void pop() => state?.pop();

//   static NavigatorState? get state => navigatorKey.currentState;
// }
