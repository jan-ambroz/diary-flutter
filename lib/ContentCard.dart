import 'package:flutter/material.dart';
import 'package:flutter_app/DayInputs.dart';
import 'package:flutter_app/providers/DbProvider.dart';

import 'model/day.dart';

class ContentCard extends StatefulWidget {
  @override
  _ContentCardState createState() => _ContentCardState();
}

class _ContentCardState extends State<ContentCard> {
  final DayInputs dayInputs = new DayInputs();

  @override
  Widget build(BuildContext context) {
    return new Card(
      elevation: 4.0,
      margin: const EdgeInsets.all(8.0),
      child: DefaultTabController(
        child: new LayoutBuilder(
          builder: (BuildContext context, BoxConstraints viewportConstraints) {
            return Column(
              children: <Widget>[
                _buildTabBar(),
                _buildContentContainer(viewportConstraints),
              ],
            );
          },
        ),
        length: 3,
      ),
    );
  }

  Widget _buildTabBar({bool showFirstOption}) {
    return Stack(
      children: <Widget>[
        new Positioned.fill(
          top: null,
          child: new Container(
            height: 2.0,
            color: new Color(0xFFEEEEEE),
          ),
        ),
        new TabBar(
          tabs: [
            Tab(icon: Icon(Icons.wb_sunny_outlined)),
            Tab(icon: Icon(Icons.nights_stay_outlined)),
            Tab(icon: Icon(Icons.mood_outlined)),
          ],
          labelColor: Colors.black,
          unselectedLabelColor: Colors.grey,
        ),
      ],
    );
  }

  Widget _buildContentContainer(BoxConstraints viewportConstraints) {
    return Expanded(
      child: SingleChildScrollView(
        child: new ConstrainedBox(
          constraints: new BoxConstraints(
            minHeight: viewportConstraints.maxHeight - 48.0,
          ),
          child: new IntrinsicHeight(
            child: _buildMulticityTab(),
          ),
        ),
      ),
    );
  }

  Widget _buildMulticityTab() {
    return Column(
      children: <Widget>[
        Expanded(child: DayInputs()),
        Padding(
          padding: const EdgeInsets.only(bottom: 16.0, top: 8.0),
          child: FloatingActionButton(
            onPressed: () {
              _getDataFromInputs();
            },
            child: Icon(Icons.save_alt, size: 36.0),
            backgroundColor: Colors.red,
          ),
        ),
      ],
    );
  }

  void _getDataFromInputs() {
    String data = dayInputs.extractDataFromInputs();
    int timestamp = DateTime.now().millisecondsSinceEpoch;

    DBProvider.db.newDay(new Day(id: 234, data: data, timestamp: timestamp));
  }
}
