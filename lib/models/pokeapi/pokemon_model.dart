// ignore_for_file: prefer_collection_literals

import 'dart:convert';

import 'abilities_model.dart';
import 'stats_model.dart';
import 'types_model.dart';

class PokemonName {
  late int? id;
  late String? name;

  PokemonName(this.id, this.name);

  PokemonName.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  static Map<String, dynamic> toMap(PokemonName pokemon) => {
    'id': pokemon.id,
    'name': pokemon.name,
  };

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}

class PokemonStore {
  late int? id;
  late String? name;
  late List<Types>? types; 

  PokemonStore(this.id, this.name, this.types);

  PokemonStore.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    types = <Types>[];
    json['types'].forEach((v) {
      types!.add(Types.fromJson(v));
    });
  }

  static Map<String, dynamic> toMap(PokemonStore pokemon) => {
    'id': pokemon.id,
    'name': pokemon.name,
    'types': pokemon.types,
  };

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['types'] = types;
    return data;
  }

  static String encode(List<PokemonStore> pokemon) => json.encode(
    pokemon
      .map<Map<String, dynamic>>((pokemon) => PokemonStore.toMap(pokemon))
      .toList(),
  );

  static List<PokemonStore> decode(String pokemon) =>
    (json.decode(pokemon) as List<dynamic>)
        .map<PokemonStore>((item) => PokemonStore.fromJson(item))
        .toList();
}


class Pokemon {
  late int? id;
  late String? name;
  late List<Types>? types; 
  late List<Abilities>? abilities;
  late int? height;
  late List<Stats>? stats;
  late int? weight;

  Pokemon(this.id, this.name, this.types, this.abilities, this.height, this.stats, this.weight);

  Pokemon.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    
    abilities = <Abilities>[];
      json['abilities'].forEach((v) {
        abilities!.add(Abilities.fromJson(v));
      });
    height = json['height'];
    stats = <Stats>[];
      json['stats'].forEach((v) {
        stats!.add(Stats.fromJson(v));
      });
    weight = json['weight'];
    types = <Types>[];
    json['types'].forEach((v) {
      types!.add(Types.fromJson(v));
    });
  }

  static Map<String, dynamic> toMap(Pokemon pokemon) => {
    'id': pokemon.id,
    'name': pokemon.name,
    'types': pokemon.types,
    'abilities': pokemon.abilities,
    'height': pokemon.height,
    'stats': pokemon.stats,
    'weight': pokemon.weight,
  };

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['types'] = types;
    data['abilities'] = abilities;
    data['height'] = height;
    data['stats'] = stats;
    data['weight'] = weight;
    return data;
  }

  static String encode(List<Pokemon> pokemon) => json.encode(
    pokemon
      .map<Map<String, dynamic>>((pokemon) => Pokemon.toMap(pokemon))
      .toList(),
  );

  static List<Pokemon> decode(String pokemon) =>
    (json.decode(pokemon) as List<dynamic>)
        .map<Pokemon>((item) => Pokemon.fromJson(item))
        .toList();

}