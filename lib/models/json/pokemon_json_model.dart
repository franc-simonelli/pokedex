// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:pokedex/models/pokeapi/abilities_model.dart';

class PokemonJson {
  late String id;
  late String name;
  late String imageurl;
  late String xdescription;
  late String height;
  late String weight;
  late String category;
  late List<String> typeofpokemon;
  late List<String> weaknesses;
  late List<String> evolutions;
  late List<String> abilities;
  late List<Abilities>? abilitiesApi;
  late int hp;
  late int attack;
  late int defense;
  late int special_attack;
  late int special_defense;
  late int speed;
  late int total;
  late String? male_percentage;
  late String? female_percentage;
  late int genderless;
  late String cycles;
  late String egg_groups;
  late String evolvedfrom;
  late String reason;
  late String base_exp;
  late int? numberPokedex;


  PokemonJson();

  PokemonJson.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    imageurl = json['imageurl'];
    xdescription = json['xdescription'];
    height = json['height'];
    weight = json['weight'];
    category = json['category'];
    typeofpokemon = (json['typeofpokemon'] as List<dynamic>).map((e) => e as String).toList();
    weaknesses = (json['weaknesses'] as List<dynamic>?)?.map((e) => e as String).toList() ??[];
    evolutions = (json['evolutions'] as List<dynamic>?)?.map((e) => e as String).toList() ??[];
    abilities = (json['abilities'] as List<dynamic>?)?.map((e) => e as String).toList() ??[];

    abilitiesApi = <Abilities>[];
      json['abilitiesApi'].forEach((v) {
        abilitiesApi!.add(Abilities.fromJson(v));
      });

    hp = json['hp'];
    attack = json['attack'];
    defense = json['defense'];
    special_attack = json['special_attack'];
    special_defense = json['special_defense'];
    speed = json['speed'];
    total = json['total'];
    male_percentage = json['male_percentage'];
    female_percentage = json['female_percentage'];
    genderless = json['genderless'];
    cycles = json['cycles'];
    egg_groups = json['egg_groups'];
    evolvedfrom = json['evolvedfrom'];
    reason = json['reason'];
    base_exp = json['base_exp'];
    numberPokedex = json['numberPokedex'];
  }

  static String encode(List<PokemonJson> pokemon) => json.encode(
    pokemon
      .map<Map<String, dynamic>>((pokemon) => PokemonJson.toMap(pokemon))
      .toList(),
  );

  static List<PokemonJson> decode(String pokemon) =>
    (json.decode(pokemon) as List<dynamic>)
        .map<PokemonJson>((item) => PokemonJson.fromJson(item))
        .toList();

  

  static Map<String, dynamic> toMap(PokemonJson pokemon) => {
    'id': pokemon.id,
    'name': pokemon.name,
    'imageurl': pokemon.imageurl,
    'xdescription': pokemon.xdescription,
    'height': pokemon.height,
    'weight': pokemon.weight,
    'category': pokemon.category,
    'typeofpokemon': pokemon.typeofpokemon,
    'weaknesses': pokemon.weaknesses,
    'evolutions': pokemon.evolutions,
    'abilities': pokemon.abilities,
    'abilitiesApi': pokemon.abilitiesApi,
    'hp': pokemon.hp,
    'attack': pokemon.attack,
    'defense': pokemon.defense,
    'special_attack': pokemon.special_attack,
    'special_defense': pokemon.special_defense,
    'speed': pokemon.speed,
    'total': pokemon.total,
    'male_percentage': pokemon.male_percentage,
    'female_percentage': pokemon.female_percentage,
    'genderless': pokemon.genderless,
    'cycles': pokemon.cycles,
    'egg_groups': pokemon.egg_groups,
    'evolvedfrom': pokemon.evolvedfrom,
    'reason': pokemon.reason,
    'base_exp': pokemon.base_exp,
    'numberPokedex': pokemon.numberPokedex,

  };
}

class PokemonJsonFromApi {
  late String id;
  late String name;
  late String imageurl;
  late String xdescription;
  late String height;
  late String weight;
  late String category;
  late List<String> typeofpokemon;
  late List<String> weaknesses;
  late List<String> evolutions;
  late List<String> abilities;
  late int hp;
  late int attack;
  late int defense;
  late int special_attack;
  late int special_defense;
  late int speed;
  late int total;
  late String? male_percentage;
  late String? female_percentage;
  late int genderless;
  late String cycles;
  late String egg_groups;
  late String evolvedfrom;
  late String reason;
  late String base_exp;

  PokemonJsonFromApi();

  PokemonJsonFromApi.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    imageurl = json['imageurl'];
    xdescription = json['xdescription'];
    height = json['height'];
    weight = json['weight'];
    category = json['category'];
    typeofpokemon = (json['typeofpokemon'] as List<dynamic>).map((e) => e as String).toList();
    weaknesses = (json['weaknesses'] as List<dynamic>?)?.map((e) => e as String).toList() ??[];
    evolutions = (json['evolutions'] as List<dynamic>?)?.map((e) => e as String).toList() ??[];
    abilities = (json['abilities'] as List<dynamic>?)?.map((e) => e as String).toList() ??[];
    hp = json['hp'];
    attack = json['attack'];
    defense = json['defense'];
    special_attack = json['special_attack'];
    special_defense = json['special_defense'];
    speed = json['speed'];
    total = json['total'];
    male_percentage = json['male_percentage'];
    female_percentage = json['female_percentage'];
    genderless = json['genderless'];
    cycles = json['cycles'];
    egg_groups = json['egg_groups'];
    evolvedfrom = json['evolvedfrom'];
    reason = json['reason'];
    base_exp = json['base_exp'];
  }

  static String encode(List<PokemonJson> pokemon) => json.encode(
    pokemon
      .map<Map<String, dynamic>>((pokemon) => PokemonJson.toMap(pokemon))
      .toList(),
  );

  static List<PokemonJson> decode(String pokemon) =>
    (json.decode(pokemon) as List<dynamic>)
        .map<PokemonJson>((item) => PokemonJson.fromJson(item))
        .toList();

  

  static Map<String, dynamic> toMap(PokemonJson pokemon) => {
    'id': pokemon.id,
    'name': pokemon.name,
    'imageurl': pokemon.imageurl,
    'xdescription': pokemon.xdescription,
    'height': pokemon.height,
    'weight': pokemon.weight,
    'category': pokemon.category,
    'typeofpokemon': pokemon.typeofpokemon,
    'weaknesses': pokemon.weaknesses,
    'evolutions': pokemon.evolutions,
    'abilities': pokemon.abilities,
    'hp': pokemon.hp,
    'attack': pokemon.attack,
    'defense': pokemon.defense,
    'special_attack': pokemon.special_attack,
    'special_defense': pokemon.special_defense,
    'speed': pokemon.speed,
    'total': pokemon.total,
    'male_percentage': pokemon.male_percentage,
    'female_percentage': pokemon.female_percentage,
    'genderless': pokemon.genderless,
    'cycles': pokemon.cycles,
    'egg_groups': pokemon.egg_groups,
    'evolvedfrom': pokemon.evolvedfrom,
    'reason': pokemon.reason,
    'base_exp': pokemon.base_exp,


  };
}

  

