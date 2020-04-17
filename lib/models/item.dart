class Item {
  int id;
  String by;
  int time;
  String text;
  String url;
  int score;
  String title;

  Item({
    this.id,
    this.by,
    this.time,
    this.text,
    this.url,
    this.score,
    this.title,
  });

  Item.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    by = json["by"];
    time = json["time"];
    text = json["text"];
    url = json["url"];
    score = json["score"];
    title = json["title"];
  }
}
