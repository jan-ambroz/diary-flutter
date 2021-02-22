import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/CustomAppbar.dart';
import 'package:flutter_app/model/day.dart';
import 'package:flutter_app/providers/DbProvider.dart';

import '../DayCard.dart';

class DaysPage extends StatefulWidget {
  @override
  _DaysPageState createState() => _DaysPageState();
}

class _DaysPageState extends State<DaysPage> with TickerProviderStateMixin {
  List<Day> days;

  @override
  void initState() {
    super.initState();

    DBProvider.db.getAllDays().then(
          (days) => setState(() {
            this.days = days;
          }),
        );
  }

  @override
  Widget build(BuildContext context) {
    if (days == null) {
      return new Scaffold(
        appBar: new AppBar(
          title: new Text("Loading..."),
        ),
      );
    } else {
      return Scaffold(
        body: new Stack(
          children: <Widget>[
            CustomAppbar(
              height: 180.0,
            ),
            Positioned.fill(
              top: MediaQuery.of(context).padding.top + 64.0,
              child: SingleChildScrollView(
                child: new Column(
                  children: _buildTickets().toList(),
                ),
              ),
            )
          ],
        ),
      );
    }
  }

  Iterable<Widget> _buildTickets() {
    return days.map((stop) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
        child: DayCard(day: stop),
      );
    });
  }

  _buildFab() {
    return FloatingActionButton(
      onPressed: () => Navigator.of(context).pop(),
      child: new Icon(Icons.fingerprint),
    );
  }
}
