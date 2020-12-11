import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';
import 'package:wolfpack_assessment/models/data.dart';
import 'package:wolfpack_assessment/models/global.dart';

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

class MomentCard extends StatefulWidget {
  @override
  _MomentCardState createState() => _MomentCardState();
}

class _MomentCardState extends State<MomentCard> {
  @override
  Widget build(BuildContext context) {
    return GroupedListView<dynamic, DateTime>(
      elements: moments,
      groupBy: (moments) {
        return moments.date;
      },
      groupSeparatorBuilder: (DateTime date) => MomentGroupSeparator(
        date: date,
      ),
      order: GroupedListOrder.ASC,
      itemBuilder: (context, dynamic moments) => Card(
        color: moments.complete == true ? globalGreen : globalLightGrey,
        child: CheckboxListTile(
          secondary: Icon(
            moments.name == "Lunch" ? Icons.free_breakfast : Icons.work,
            color: moments.complete == true ? Colors.white : Colors.black,
          ),
          title: Text(
            moments.name,
            style: TextStyle(
                color: moments.complete == true ? Colors.white : Colors.black),
          ),
          subtitle: Text(
            "${DateFormat('jm').format(moments.time)}",
            style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16,
                color: moments.complete == true ? Colors.white : Colors.black),
          ),
          checkColor: globalGreen,
          activeColor: Colors.white,
          value: moments.complete,
          onChanged: (bool newValue) => {
            setState(() {
              moments.complete = newValue;
            })
          },
        ),
      ),
    );
  }
}
