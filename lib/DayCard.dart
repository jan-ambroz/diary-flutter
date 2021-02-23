import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'model/day.dart';

class DayCard extends StatelessWidget {
  final Day day;

  const DayCard({Key key, this.day}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      margin: const EdgeInsets.all(2.0),
      child: _buildCardContent(),
    );
  }

  Container _buildCardContent() {
    TextStyle airportNameStyle =
        new TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600);
    TextStyle airportShortNameStyle =
        new TextStyle(fontSize: 36.0, fontWeight: FontWeight.w200);
    TextStyle flightNumberStyle =
        new TextStyle(fontSize: 12.0, fontWeight: FontWeight.w500);
    return Container(
      height: 104.0,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 32.0, top: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Text(day.date, style: airportNameStyle),
                  ),
                  Text(day.date, style: airportShortNameStyle),
                ],
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Icon(
                  Icons.airplanemode_active,
                  color: Colors.red,
                ),
              ),
              Text(day.date, style: flightNumberStyle),
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 40.0, top: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Text(day.date, style: airportNameStyle),
                  ),
                  Text(day.date, style: airportShortNameStyle),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
