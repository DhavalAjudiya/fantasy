class CompletedMatchModal {
  String? time;
  String? t1;
  String? t2;
  String? i1;
  String? i2;
  String? header;
  String? subheader;
  String? nr1;
  String? nr2;
  String? tourimage;
  String? tourname;
  String? toss;
  String? manOfi;
  String? manofn;
  String? manofp;
  List<TopPlayer>? topplayer;
  List<Fantasy>? fantasypoint;

  CompletedMatchModal({
    this.time,
    this.t1,
    this.t2,
    this.i1,
    this.i2,
    this.header,
    this.subheader,
    this.nr1,
    this.nr2,
    this.tourimage,
    this.tourname,
    this.toss,
    this.manOfi,
    this.manofn,
    this.manofp,
    this.topplayer,
    this.fantasypoint,
  });

  CompletedMatchModal.fromMap(Map<String, dynamic> map) {
    time = map["time"] ?? '';
    t1 = map["t1"] ?? '';
    t2 = map["t2"];
    i1 = map["i1"];
    i2 = map["i2"];
    header = map["header"];
    subheader = map["subheader"];
    nr1 = map["nr1"];
    nr2 = map["nr2"];
    tourimage = map["tourimage"];
    tourname = map["tourname"];
    toss = map["toss"];
    manOfi = map["manOfi"];
    manofn = map["manofn"];
    manofp = map["manofp"];
    topplayer = [
      for (final skill in map['topplayer'] ?? []) TopPlayer.fromMap(skill),
    ];
    fantasypoint = [
      for (final skill in map['fantasypoint'] ?? []) Fantasy.fromMap(skill),
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
      "tourimage": tourimage,
      "tourname": tourname,
      "toss": toss,
      "manOfi": manOfi,
      "manofn": manofn,
      "manofp": manofp,
      "topplayer": [for (final skill in this.topplayer ?? []) skill.toJson()],
      "fantasypoint": [for (final skill in this.fantasypoint ?? []) skill.toJson()],
    };
  }
}

class TopPlayer {
  String? playername;
  String? playerimage;
  String? playerw;
  String? playerc;
  String? playerr;
  String? playero;

  TopPlayer({
    this.playername,
    this.playerimage,
    this.playerw,
    this.playerc,
    this.playerr,
    this.playero,
  });

  factory TopPlayer.fromMap(Map<String, dynamic> json) => TopPlayer(
        playername: json["playername"],
        playerimage: json["playerimage"],
        playerw: json["playerw"],
        playerc: json["playerc"],
        playerr: json["playerr"],
        playero: json["playero"],
      );

  Map<String, dynamic> toMap() => {
        "playername": playername,
        "playerimage": playerimage,
        "playerw": playerw,
        "playerc": playerc,
        "playerr": playerr,
        "playero": playero,
      };
}

class Fantasy {
  String? expertname;
  String? expertimage;
  String? fantasyimage;
  String? fantasypoint;
  String? teamtype;

  Fantasy({
    this.expertname,
    this.expertimage,
    this.fantasyimage,
    this.fantasypoint,
    this.teamtype,
  });

  factory Fantasy.fromMap(Map<String, dynamic> json) => Fantasy(
        expertname: json["expertname"],
        expertimage: json["expertimage"],
        fantasyimage: json["fantasyimage"],
        fantasypoint: json["fantasypoint"],
        teamtype: json["teamtype"],
      );

  Map<String, dynamic> toMap() => {
        "expertname": expertname,
        "expertimage": expertimage,
        "fantasyimage": fantasyimage,
        "fantasypoint": fantasypoint,
        "teamtype": teamtype,
      };
}
