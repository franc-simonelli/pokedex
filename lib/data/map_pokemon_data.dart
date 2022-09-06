// ignore_for_file: prefer_final_fields, prefer_const_constructors

import 'package:flutter/material.dart';
import '../constants/color.dart';
import '../models/json/pokemon_json_model.dart';

class MapPokemonData {
  
  mappingPokemon(pokemon, info, index, context) {
    PokemonJson pok = PokemonJson();
      pok.id = pokemon.id;
      pok.name = pokemon.name;
      pok.imageurl = pokemon.imageurl;
      pok.xdescription = pokemon.xdescription;
      pok.category = pokemon.category;
      pok.typeofpokemon = pokemon.typeofpokemon;
      pok.weaknesses = pokemon.weaknesses;
      pok.evolutions = pokemon.evolutions;
      pok.abilities = pokemon.abilities;
      pok.male_percentage = pokemon.male_percentage;
      pok.female_percentage = pokemon.female_percentage;
      pok.genderless = pokemon.genderless;
      pok.cycles = pokemon.cycles;
      pok.egg_groups = pokemon.egg_groups;
      pok.evolvedfrom = pokemon.evolvedfrom;
      pok.reason = pokemon.reason;
      pok.base_exp = pokemon.base_exp;
      pok.hp = info.stats![0].base_stat!;
      pok.attack = info.stats![1].base_stat!;
      pok.defense = info.stats![2].base_stat!;
      pok.special_attack = info.stats![3].base_stat!;
      pok.special_defense = info.stats![4].base_stat!;
      pok.speed = info.stats![5].base_stat!;
      pok.total = pok.hp + pok.attack + pok.defense + pok.special_attack + pok.special_defense + pok.speed;
      pok.weight = (info.weight! / 10).toString();
      pok.height = (info.height! / 10).toString();
      pok.abilitiesApi = info.abilities;
      pok.numberPokedex = index;
      pok.isPreferito = false;
      return pok;
  }

  mappingColors(type) {
    switch(type) {
      case 'Grass':
        return AppColors.lightGreen;
      case 'Poison':
        return Colors.deepPurpleAccent;
      case 'Fire':
        return Colors.redAccent;
      case 'Flying':
        return Colors.lightBlue.shade300;
      case 'Water':
        return Colors.blue;
      case 'Bug':
        return Color(0xFFa8b821);
      case 'Normal':
        return AppColors.beige;
      case 'Electric':
        return AppColors.yellow;
      case 'Ground':
        return Colors.brown;
      case 'Fairy':
        return Colors.pink.shade300;
      case 'Fighting':
        return Colors.orange;
      case 'Psychic':
        return Colors.pink;
      case 'Rock':
        return Color(0xFFb8a038);
      case 'Ghost':
        return Colors.deepPurple.shade900;
      case 'Ice':
        return Colors.blueAccent;
      case 'Dragon':
        return Colors.blue.shade900;
      case 'Dark':
        return Colors.black87;
      case 'Steel':
        return Colors.grey.shade800;
    }
  }
}