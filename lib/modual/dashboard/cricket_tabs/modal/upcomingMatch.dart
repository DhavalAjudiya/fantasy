class UpcomingMatchModal {
  String? id;
  String? time;
  String? t1;
  String? t2;
  String? i1;
  String? i2;
  String? header;
  String? subheader;
  String? nr1;
  String? nr2;
  bool? isFantasy;
  List<TeamFirst>? team1;
  List<TeamSecond>? team2;
  List<Info>? info;

  UpcomingMatchModal({
    this.id,
    this.time,
    this.t1,
    this.t2,
    this.i1,
    this.i2,
    this.header,
    this.subheader,
    this.nr1,
    this.nr2,
    this.isFantasy,
    this.team1,
    this.team2,
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
    nr1 = map["nr1"];
    nr2 = map["nr2"];

    team1 = [
      for (final skill in map['team1'] ?? []) TeamFirst.fromMap(skill),
    ];
    team2 = [
      for (final skill in map['team2'] ?? []) TeamSecond.fromMap(skill),
    ];
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
      "nr1": nr1,
      "nr2": nr2,
      "team1": [for (final skill in this.team1 ?? []) skill.toJson()],
      "team2": [for (final skill in this.team2 ?? []) skill.toJson()],
      "info": [for (final skill in this.info ?? []) skill.toJson()],
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
