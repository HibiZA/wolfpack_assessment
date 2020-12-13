import 'package:circular_check_box/circular_check_box.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';
import 'package:timeline_tile/timeline_tile.dart';

import 'package:wolfpack_assessment/models/data.dart';
import 'package:wolfpack_assessment/models/global.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:wolfpack_assessment/moment.dart';

class ReportView extends StatefulWidget {
  @override
  _ReportViewState createState() => _ReportViewState();
}

class _ReportViewState extends State<ReportView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          child: ListTile(
            leading: CircularPercentIndicator(
              radius: 48.0,
              percent: getTakenPercentage(moments),
              lineWidth: 8,
              center: Text(
                "${getTakenPercentage(moments) * 100}%",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 9.0),
              ),
              progressColor: globalLightGreen,
            ),
            title: Text("Weekly Adherance"),
            subtitle: Text(
                "${DateFormat('E c MMMM').format(moments[0].date)} - ${DateFormat('E c MMMM').format(moments[moments.length - 1].date)}"),
          ),
        ),
        Expanded(
          child: GroupedListView<dynamic, DateTime>(
            shrinkWrap: true,
            elements: moments,
            groupBy: (moments) {
              return moments.date;
            },
            groupSeparatorBuilder: (DateTime date) => MomentGroupSeparator(
              date: date,
            ),
            order: GroupedListOrder.ASC,
            itemBuilder: (context, dynamic moments) =>
                ReportCard(meds: moments.medicine),
          ),
        ),
      ],
    );
  }
}

class ReportCard extends StatefulWidget {
  final List<Medicine> meds;
  ReportCard({this.meds});
  @override
  _ReportCardState createState() => _ReportCardState();
}

class _ReportCardState extends State<ReportCard> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Card(
        child: ListTile(
          trailing: CircularCheckBox(
            activeColor: globalLightGreen,
            value: this.widget.meds[0].taken,
            onChanged: (value) {},
          ),
          title: Text(this.widget.meds[0].medicine),
          subtitle: Text(this.widget.meds[0].dosage),
          leading: FaIcon(
            FontAwesomeIcons.capsules,
            size: 35,
            color: globalGreen,
          ),
        ),
      ),
      if (this.widget.meds.length == 2)
        Card(
          child: ListTile(
            trailing: CircularCheckBox(
              activeColor: globalLightGreen,
              value: this.widget.meds[1].taken,
              onChanged: (value) {},
            ),
            title: Text(this.widget.meds[1].medicine),
            subtitle: Text(this.widget.meds[1].dosage),
            leading: FaIcon(
              FontAwesomeIcons.capsules,
              size: 35,
              color: globalGreen,
            ),
          ),
        ),
    ]);
  }
}

double getTakenPercentage(List<Moments> moments) {
  double count = 0.0;
  moments.forEach(
    (element) {
      element.medicine.forEach(
        (val) {
          if (val.taken) {
            count = count + 1;
            print(count / element.medicine.length);
          }
        },
      );
      count = count / element.medicine.length;
      print(count);
    },
  );
  return count;
}
