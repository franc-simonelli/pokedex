// ignore_for_file: prefer_collection_literals

import 'abilities_model.dart';
import 'stats_model.dart';
import 'types_model.dart';

class Information {
  late List<Types>? types; 
  late List<Abilities>? abilities;
  late int? height;
  late List<Stats>? stats;
  late int? weight;

  Information(this.types, this.height, this.stats, this.weight);

  Information.fromJson(Map<String, dynamic> json) {
    types = json['types'];
    height = json['height'];
    stats = json['stats'];
    weight = json['weight'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['types'] = types;
    data['height'] = height;
    data['stats'] = stats;
    data['weight'] = weight;
    return data;
  }
}