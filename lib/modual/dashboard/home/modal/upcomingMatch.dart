class UpcomingMatchModal {
  String? time;
  String? t1;
  String? t2;
  String? i1;
  String? i2;
  String? header;
  String? subheader;
  String? nr1;
  String? nr2;
  List<Player>? player;

  UpcomingMatchModal({
    this.time,
    this.t1,
    this.t2,
    this.i1,
    this.i2,
    this.header,
    this.subheader,
    this.nr1,
    this.nr2,
    this.player,
  });

  UpcomingMatchModal.fromMap(Map<String, dynamic> map) {
    time = map["time"] ?? '';
    t1 = map["t1"] ?? '';
    t2 = map["t2"];
    i1 = map["i1"];
    i2 = map["i2"];
    header = map["header"];
    subheader = map["subheader"];
    nr1 = map["nr1"];
    nr2 = map["nr2"];

    player = [
      for (final skill in map['player'] ?? []) Player.fromMap(skill),
    ];
  }

  Map<String, dynamic> toMap() {
    return {
      "time": time,
      "t1": t1,
      "t2": t2,
      "i1": i1,
      "i2": i2,
      "header": header,
      "subheader": subheader,
      "nr1": nr1,
      "nr2": nr2,
      "player": [for (final skill in this.player ?? []) skill.toJson()],
    };
  }
}

class Player {
  bool? play;
  String? name;
  String? type;
  String? image;

  Player({
    this.play,
    this.name,
    this.type,
    this.image,
  });

  factory Player.fromMap(Map<String, dynamic> json) => Player(
        play: json["play"],
        name: json["name"],
        type: json["type"],
        image: json["image"],
      );

  Map<String, dynamic> toMap() => {
        "play": play,
        "name": name,
        "type": type,
        "image": image,
      };
}
