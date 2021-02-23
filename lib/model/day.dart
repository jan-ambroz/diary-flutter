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
  String date;
  String data;
  bool blocked;

  Day({
    this.id,
    this.date,
    this.data,
    this.blocked,
  });

  factory Day.fromMap(Map<String, dynamic> json) => new Day(
        id: json["id"],
        date: json["date"],
        data: json["data"],
        blocked: json["blocked"] == 1,
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "date": date,
        "data": data,
        "blocked": blocked,
      };
}
