// ignore_for_file: non_constant_identifier_names, prefer_collection_literals

class Stats {
  late int? base_stat;
  late Stat? stat; 

  Stats(this.base_stat, this.stat);

  Stats.fromJson(Map<String, dynamic> json) {
    base_stat = json['base_stat'];
    stat = Stat.fromJson(json["stat"]);
  }

  Map<String, dynamic> toJson() => {
    "base_stat": base_stat,
    "stat": stat!.toJson(),
  };
}

class Stat {
  late String? name;
  late String? url; 

  Stat(this.name, this.url);

  Stat.fromJson(Map<String, dynamic> json) {
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