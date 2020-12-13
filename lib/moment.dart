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
      shrinkWrap: true,
      elements: moments,
      groupBy: (moments) {
        return moments.date;
      },
      groupSeparatorBuilder: (DateTime date) => MomentGroupSeparator(
        date: date,
      ),
      order: GroupedListOrder.ASC,
      itemBuilder: (context, dynamic moments) => Card(
        color:
            getTakenAllMeds(moments.medicine) ? globalGreen : globalLightGrey,
        child: ExpansionTile(
          key: new PageStorageKey<int>(moments.id),
          children: [
            Card(
              color: globalLightGrey,
              child: CheckboxListTile(
                title: Text(moments.medicine[0].medicine),
                subtitle: Text(moments.medicine[0].dosage),
                value: moments.medicine[0].taken,
                activeColor: globalLightGreen,
                onChanged: (bool newValue) {
                  setState(() {
                    moments.medicine[0].taken = newValue;
                  });
                },
              ),
            ),
            if (moments.medicine.length == 2)
              Card(
                color: globalLightGrey,
                child: CheckboxListTile(
                  title: Text(moments.medicine[1].medicine),
                  subtitle: Text(moments.medicine[1].dosage),
                  value: moments.medicine[1].taken,
                  activeColor: globalLightGreen,
                  onChanged: (bool newValue) {
                    setState(() {
                      moments.medicine[1].taken = newValue;
                    });
                  },
                ),
              ),
          ],
          leading: Icon(
            moments.name == "Lunch" ? Icons.free_breakfast : Icons.work,
            color: getTakenAllMeds(moments.medicine) == true
                ? Colors.white
                : Colors.black,
          ),
          title: Text(
            moments.name,
            style: TextStyle(
                color: getTakenAllMeds(moments.medicine)
                    ? Colors.white
                    : Colors.black),
          ),
          subtitle: Text(
            "${DateFormat('jm').format(moments.time)}",
            style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16,
                color: getTakenAllMeds(moments.medicine)
                    ? Colors.white
                    : Colors.black),
          ),
          trailing: Checkbox(
            value: getTakenAllMeds(moments.medicine),
            checkColor: globalGreen,
            activeColor: Colors.white,
            onChanged: (bool newValue) => {
              setState(() {
                moments.complete = newValue;
              })
            },
          ),
          // checkColor: globalGreen,
          // activeColor: Colors.white,
          // value: moments.complete,
          // onChanged: (bool newValue) => {
          //   setState(() {
          //     moments.complete = newValue;
          //   })
          // },
        ),
      ),
    );
  }
}

bool getTakenAllMeds(List<Medicine> meds) {
  bool val = false;
  if (meds.length == 2) {
    if (meds[0].taken && meds[1].taken) {
      val = true;
    } else {
      val = false;
    }
  } else {
    if (meds[0].taken) {
      val = true;
    } else {
      val = false;
    }
  }
  return val;
}
