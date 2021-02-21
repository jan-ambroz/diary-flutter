import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DayInputs extends StatelessWidget {
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
                decoration: InputDecoration(
                  icon: Icon(Icons.mood_outlined, color: Colors.red),
                  labelText: "I am grateful for...",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 0.0, 64.0, 8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  icon: Icon(Icons.mood_outlined, color: Colors.red),
                  labelText: "I am grateful for...",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 0.0, 64.0, 8.0),
              child: TextFormField(
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
}
