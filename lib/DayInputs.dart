import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/providers/DbProvider.dart';

import 'model/day.dart';

class DayInputs extends StatefulWidget {
  @override
  _DayInputsState createState() => _DayInputsState();

  final Stream shouldTriggerChange;

  DayInputs({@required this.shouldTriggerChange});
}

class _DayInputsState extends State<DayInputs> {
  StreamSubscription streamSubscription;

  @override
  initState() {
    super.initState();
    streamSubscription =
        widget.shouldTriggerChange.listen((_) => extractDataFromInputs());
  }

  @override
  dispose() {
    super.dispose();
    streamSubscription.cancel();
  }

  @override
  didUpdateWidget(DayInputs old) {
    super.didUpdateWidget(old);
    // in case the stream instance changed, subscribe to the new one
    if (widget.shouldTriggerChange != old.shouldTriggerChange) {
      streamSubscription.cancel();
      streamSubscription =
          widget.shouldTriggerChange.listen((_) => extractDataFromInputs());
    }
  }

  final TextEditingController firstGratefulRow = TextEditingController();
  final TextEditingController secondGratefulRow = TextEditingController();
  final TextEditingController thirdGratefulRow = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 0.0, 64.0, 8.0),
              child: TextFormField(
                controller: firstGratefulRow,
                decoration: InputDecoration(
                  icon: Icon(Icons.mood_outlined, color: Colors.red),
                  labelText: "I am grateful for...",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 0.0, 64.0, 8.0),
              child: TextFormField(
                controller: secondGratefulRow,
                decoration: InputDecoration(
                  icon: Icon(Icons.mood_outlined, color: Colors.red),
                  labelText: "I am grateful for...",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 0.0, 64.0, 8.0),
              child: TextFormField(
                controller: thirdGratefulRow,
                decoration: InputDecoration(
                  icon: Icon(Icons.mood_outlined, color: Colors.red),
                  labelText: "I am grateful for...",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String extractDataFromInputs() {
    Map<String, String> data = {
      "grat_one": firstGratefulRow.text,
      "grat_two": secondGratefulRow.text,
      "grat_three": thirdGratefulRow.text
    };

    DateTime now = new DateTime.now();
    String convertedDateTime =
        "${now.year.toString()}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')}";

    String encodedJson = json.encode(data);

    DBProvider.db
        .createDay(new Day(timestamp: convertedDateTime, data: encodedJson));
  }
}
