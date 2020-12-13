import 'package:flutter/material.dart';
import 'package:wolfpack_assessment/models/global.dart';
import 'package:wolfpack_assessment/report.dart';
import 'moment.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wolfpack Assignment',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: globalGrey,
      ),
      home: MyHomePage(title: 'Wolfpack Assignment'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
            appBar: AppBar(
              bottom: TabBar(
                indicatorColor: globalLightGreen,
                tabs: [
                  Tab(icon: Icon(Icons.medical_services)),
                  Tab(
                    icon: Icon(Icons.today),
                  )
                ],
              ),
              backgroundColor: globalGreen,
            ),
            body: TabBarView(
              children: [MomentCard(), ReportView()],
            ),
            backgroundColor: globalGrey),
      ),
    );
  }
}
