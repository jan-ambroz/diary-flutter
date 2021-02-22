import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DayInputs extends StatelessWidget {
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

    return json.encode(data);
  }
}
