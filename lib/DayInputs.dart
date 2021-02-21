import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DayInputs extends StatelessWidget {
  final _firstGratefulRow = TextEditingController();
  final _secondGratefulRow = TextEditingController();
  final _thirdGratefulRow = TextEditingController();

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
                controller: _firstGratefulRow,
                decoration: InputDecoration(
                  icon: Icon(Icons.mood_outlined, color: Colors.red),
                  labelText: "I am grateful for...",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 0.0, 64.0, 8.0),
              child: TextFormField(
                controller: _secondGratefulRow,
                decoration: InputDecoration(
                  icon: Icon(Icons.mood_outlined, color: Colors.red),
                  labelText: "I am grateful for...",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 0.0, 64.0, 8.0),
              child: TextFormField(
                controller: _thirdGratefulRow,
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
      "grat_one": _firstGratefulRow.text,
      "grat_two": _secondGratefulRow.text,
      "grat_three": _thirdGratefulRow.text
    };

    return json.encode(data);
  }
}
