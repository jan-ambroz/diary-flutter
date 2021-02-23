import 'dart:convert';

Day clientFromJson(String str) {
  final jsonData = json.decode(str);
  return Day.fromMap(jsonData);
}

String clientToJson(Day data) {
  final dyn = data.toMap();
  return json.encode(dyn);
}

class Day {
  int id;
  String timestamp;
  String data;
  bool blocked;

  Day({
    this.id,
    this.timestamp,
    this.data,
    this.blocked,
  });

  factory Day.fromMap(Map<String, dynamic> json) => new Day(
        id: json["id"],
        timestamp: json["timestamp"],
        data: json["data"],
        blocked: json["blocked"] == 1,
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "date": timestamp,
        "data": data,
        "blocked": blocked,
      };

  getReadableDate() {
    DateTime date = new DateTime.fromMillisecondsSinceEpoch(int.parse(data));
    return date.toString();
  }
}
