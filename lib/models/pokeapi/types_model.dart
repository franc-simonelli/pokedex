// ignore_for_file: prefer_collection_literals

class Types {
  late int? slot;
  late Type? type; 

  Types(this.slot, this.type);

  Types.fromJson(Map<String, dynamic> json) {
    slot = json['slot'];
    type = Type.fromJson(json["type"]);
  }

  Map<String, dynamic> toJson() => {
    "slot": slot,
    "type": type!.toJson(),
  };
}

class Type {
  late String? name;
  late String? url; 

  Type(this.name, this.url);

  Type.fromJson(Map<String, dynamic> json) {
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