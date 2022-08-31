// ignore_for_file: prefer_collection_literals

class Abilities {
  late Ability? ability; 

  Abilities(this.ability);

  Abilities.fromJson(Map<String, dynamic> json) {
    ability = Ability.fromJson(json["ability"]);
  }

  Map<String, dynamic> toJson() => {
    "ability": ability!.toJson(),
  };
}

class Ability {
  late String? name;
  late String? url; 

  Ability(this.name, this.url);

  Ability.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['name'] = name;
    data['url'] = url;
    return data;
  }
}