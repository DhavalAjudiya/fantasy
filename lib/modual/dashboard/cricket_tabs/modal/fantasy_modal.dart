class FantasyModal {
  bool? lineup;
  String? id;

  List<Fantasy>? fantasy;
  List<PlayerState>? playerstate;

  FantasyModal({
    this.lineup,
    this.id,
    this.fantasy,
    this.playerstate,
  });

  FantasyModal.fromMap(Map<String, dynamic> map) {
    lineup = map["lineup"] ?? '';
    id = map["id"] ?? '';

    fantasy = [
      for (final skill in map['fantasy'] ?? []) Fantasy.fromMap(skill),
    ];
    playerstate = [
      for (final skill in map['playerstate'] ?? []) PlayerState.fromMap(skill),
    ];
  }

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "lineup": lineup,
      "fantasy": [for (final skill in this.fantasy ?? []) skill.toJson()],
      "playerstate": [for (final skill in this.playerstate ?? []) skill.toJson()],
    };
  }
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

class PlayerState {
  String? name;
  String? type;
  String? mplayed;
  String? pmatch;
  bool? announce;

  PlayerState({
    this.name,
    this.type,
    this.mplayed,
    this.pmatch,
    this.announce,
  });

  PlayerState.fromMap(Map<String, dynamic> map) {
    name = map["name"] ?? '';
    type = map["type"] ?? '';
    mplayed = map["mplayed"] ?? '';
    pmatch = map["pmatch"] ?? '';
    announce = map["announce"] ?? '';
  }

  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "type": type,
      "mplayed": mplayed,
      "pmatch": pmatch,
      "announce": announce,
    };
  }
}
