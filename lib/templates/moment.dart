import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';

class Moment extends StatefulWidget {
  @override
  _MomentState createState() => _MomentState();
}

class _MomentState extends State<Moment> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class MomentGroupSeparator extends StatefulWidget {
  final DateTime date;
  MomentGroupSeparator({this.date});

  @override
  _MomentGroupSeparatorState createState() => _MomentGroupSeparatorState();
}

class _MomentGroupSeparatorState extends State<MomentGroupSeparator> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.only(left: 16, top: 8, bottom: 8),
        child: Text(
          "${DateFormat('E c MMMM').format(this.widget.date)}",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
