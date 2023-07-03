class HighlightModal {
  String? time;
  String? title;
  String? type;
  String? video;
  String? image;
  String? app_name;
  String? description;
  String? p_of_the_match;

  HighlightModal({
    this.time,
    this.title,
    this.type,
    this.video,
    this.image,
    this.app_name,
    this.description,
    this.p_of_the_match,
  });

  HighlightModal.fromMap(Map<String, dynamic> map) {
    time = map["time"] ?? '';
    title = map["title"] ?? '';
    type = map["type"];
    video = map["video"];
    image = map["image"];
    app_name = map["app_name"];
    description = map["description"];
    p_of_the_match = map["p_of_the_match"];
  }

  Map<String, dynamic> toMap() {
    return {
      "time": time,
      "title": title,
      "type": type,
      "video": video,
      "image": image,
      "app_name": app_name,
      "description": description,
      "p_of_the_match": p_of_the_match,
    };
  }
}

class MatchTypeModal {
  String? type;

  MatchTypeModal({
    this.type,
  });

  MatchTypeModal.fromMap(Map<String, dynamic> map) {
    type = map["type"];
  }

  Map<String, dynamic> toMap() {
    return {
      "type": type,
    };
  }
}
