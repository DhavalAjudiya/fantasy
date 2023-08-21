class UpcomingMatchModal {
  String? id;
  String? time;
  String? t1;
  String? t2;
  String? i1;
  String? i2;
  String? header;
  String? subheader;
  bool? isFantasy;
  String? team1;
  String? team2;
  List<Info>? info;
  List<Fantasy>? fantasy;

  UpcomingMatchModal({
    this.id,
    this.time,
    this.t1,
    this.t2,
    this.i1,
    this.i2,
    this.header,
    this.subheader,
    this.isFantasy,
    this.team1,
    this.team2,
    this.fantasy,
    this.info,
  });

  UpcomingMatchModal.fromMap(Map<String, dynamic> map) {
    id = map["id"] ?? '';
    time = map["time"] ?? '';
    t1 = map["t1"] ?? '';
    t2 = map["t2"];
    i1 = map["i1"];
    i2 = map["i2"];
    header = map["header"];
    isFantasy = map["isFantasy"];
    subheader = map["subheader"];
    team1 = map["team1"];
    team2 = map["team2"];
    fantasy = [
      for (final skill in map['fantasy'] ?? []) Fantasy.fromMap(skill),
    ];

    // team1 = [
    //   for (final skill in map['team1'] ?? []) TeamFirst.fromMap(skill),
    // ];
    // team2 = [
    //   for (final skill in map['team2'] ?? []) TeamSecond.fromMap(skill),
    // ];
    info = [
      for (final skill in map['info'] ?? []) Info.fromMap(skill),
    ];
  }

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "time": time,
      "t1": t1,
      "t2": t2,
      "i1": i1,
      "i2": i2,
      "header": header,
      "isFantasy": isFantasy,
      "subheader": subheader,
      "team1": team1,
      "team2": team2,

      // "team1": [for (final skill in this.team1 ?? []) skill.toJson()],
      // "team2": [for (final skill in this.team2 ?? []) skill.toJson()],
      "fantasy": [for (final skill in this.fantasy ?? []) skill.toJson()],
      "info": [for (final skill in this.info ?? []) skill.toJson()],
    };
  }
}

class Info {
  String? tournamentI;
  String? tournamentN;
  String? team1I;
  String? team2I;
  String? team1N;
  String? team2N;
  String? match;
  String? matchtime;
  String? matchvenue;

  Info({
    this.tournamentI,
    this.tournamentN,
    this.team1I,
    this.team2I,
    this.team1N,
    this.team2N,
    this.match,
    this.matchtime,
    this.matchvenue,
  });

  factory Info.fromMap(Map<String, dynamic> json) => Info(
        tournamentI: json["tournamentI"],
        tournamentN: json["tournamentN"],
        team1I: json["team1I"],
        team2I: json["team2I"],
        team1N: json["team1N"],
        team2N: json["team2N"],
        match: json["match"],
        matchtime: json["matchtime"],
        matchvenue: json["matchvenue"],
      );

  Map<String, dynamic> toMap() => {
        "tournamentI": tournamentI,
        "tournamentN": tournamentN,
        "team1I": team1I,
        "team2I": team2I,
        "team1N": team1N,
        "team2N": team2N,
        "match": match,
        "matchtime": matchtime,
        "matchvenue": matchvenue,
      };
}

class Fantasy {
  String? name;
  String? image;
  String? type;
  String? vcaption;
  String? caption;
  String? teamimage;
  String? captionimage;
  String? vcaptionimage;
  String? player;
  String? cr;

  Fantasy({
    this.name,
    this.image,
    this.type,
    this.vcaption,
    this.caption,
    this.teamimage,
    this.captionimage,
    this.vcaptionimage,
    this.player,
    this.cr,
  });

  Fantasy.fromMap(Map<String, dynamic> map) {
    name = map["name"] ?? '';
    image = map["image"] ?? '';
    type = map["type"] ?? '';
    vcaption = map["vcaption"] ?? '';
    caption = map["caption"] ?? '';
    teamimage = map["teamimage"] ?? '';
    captionimage = map["captionimage"] ?? '';
    vcaptionimage = map["vcaptionimage"] ?? '';
    player = map["player"] ?? '';
    cr = map["cr"] ?? '';
  }

  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "image": image,
      "type": type,
      "vcaption": vcaption,
      "caption": caption,
      "teamimage": teamimage,
      "captionimage": captionimage,
      "vcaptionimage": vcaptionimage,
      "player": player,
      "cr": cr,
    };
  }
}

class TeamFirst {
  bool? play;
  String? name;
  String? type;
  String? image;

  TeamFirst({
    this.play,
    this.name,
    this.type,
    this.image,
  });

  factory TeamFirst.fromMap(Map<String, dynamic> json) => TeamFirst(
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

class TeamSecond {
  bool? play;
  String? name;
  String? type;
  String? image;

  TeamSecond({
    this.play,
    this.name,
    this.type,
    this.image,
  });

  factory TeamSecond.fromMap(Map<String, dynamic> json) => TeamSecond(
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
