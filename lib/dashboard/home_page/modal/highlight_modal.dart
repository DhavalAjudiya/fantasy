class HighlightModal {
  String? time;
  String? title;
  String? type;
  String? video;
  String? image;

  HighlightModal({
    this.time,
    this.title,
    this.type,
    this.video,
    this.image,
  });

  HighlightModal.fromMap(Map<String, dynamic> map) {
    time = map["time"] ?? '';
    title = map["title"] ?? '';
    type = map["type"];
    video = map["video"];
    image = map["image"];
  }

  Map<String, dynamic> toMap() {
    return {
      "time": time,
      "title": title,
      "type": type,
      "video": video,
      "image": image,
    };
  }
}
