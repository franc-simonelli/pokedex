// ignore_for_file: prefer_collection_literals

import 'abilities_model.dart';
import 'stats_model.dart';

class Information {
  // late List<Types>? types; 
  late List<Abilities>? abilities;
  late int? height;
  late List<Stats>? stats;
  late int? weight;

  Information(this.abilities, this.height, this.stats, this.weight);

  Information.fromJson(Map<String, dynamic> json) {
    abilities = <Abilities>[];
    json['abilities'].forEach((v) {
      abilities!.add(Abilities.fromJson(v));
    });
    stats = <Stats>[];
    json['stats'].forEach((v) {
      stats!.add(Stats.fromJson(v));
    });
    height = json['height'];
    weight = json['weight'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    // data['types'] = types;
    data['height'] = height;
    data['stats'] = stats;
    data['weight'] = weight;
    return data;
  }
}