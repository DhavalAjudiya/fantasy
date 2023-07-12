class FantasyModal {
  String? dataof;
  String? id;

  List<Fantasy>? fantasy;
  List<PlayerHistory>? playerhistory;

  FantasyModal({
    this.dataof,
    this.id,
    this.fantasy,
    this.playerhistory,
  });

  FantasyModal.fromMap(Map<String, dynamic> map) {
    dataof = map["dataof"] ?? '';
    id = map["id"] ?? '';

    fantasy = [
      for (final skill in map['fantasy'] ?? []) Fantasy.fromMap(skill),
    ];
    playerhistory = [
      for (final skill in map['playerhistory'] ?? []) PlayerHistory.fromMap(skill),
    ];
  }

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "dataof": dataof,
      "fantasy": [for (final skill in this.fantasy ?? []) skill.toJson()],
      "playerhistory": [for (final skill in this.playerhistory ?? []) skill.toJson()],
    };
  }
}

class Fantasy {
  String? name;
  String? image;
  List<String>? allrounder;
  List<String>? wicketkeeper;
  List<String>? bolwer;
  List<String>? batsman;

  Fantasy({
    this.name,
    this.image,
    this.allrounder,
    this.wicketkeeper,
    this.bolwer,
    this.batsman,
  });

  Fantasy.fromMap(Map<String, dynamic> map) {
    name = map["name"] ?? '';
    image = map["image"] ?? '';
    allrounder = map["allrounder"].cast<String>() ?? [];
    wicketkeeper = map["wicketkeeper"].cast<String>() ?? [];
    bolwer = map["bolwer"].cast<String>() ?? [];
    batsman = map["batsman"].cast<String>() ?? [];
  }

  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "image": image,
      "allrounder": allrounder,
      "wicketkeeper": wicketkeeper,
      "bolwer": bolwer,
      "batsman": batsman,
    };
  }
}

class PlayerHistory {
  String? name;
  String? image;
  List<String>? allrounder;
  List<String>? wicketkeeper;
  List<String>? bolwer;
  List<String>? batsman;

  PlayerHistory({
    this.name,
    this.image,
    this.allrounder,
    this.wicketkeeper,
    this.bolwer,
    this.batsman,
  });

  PlayerHistory.fromMap(Map<String, dynamic> map) {
    name = map["name"] ?? '';
    image = map["image"] ?? '';
    allrounder = map["allrounder"].cast<String>() ?? [];
    wicketkeeper = map["wicketkeeper"].cast<String>() ?? [];
    bolwer = map["bolwer"].cast<String>() ?? [];
    batsman = map["batsman"].cast<String>() ?? [];
  }

  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "image": image,
      "allrounder": allrounder,
      "wicketkeeper": wicketkeeper,
      "bolwer": bolwer,
      "batsman": batsman,
    };
  }
}
