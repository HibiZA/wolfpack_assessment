import 'package:flutter/material.dart';
import 'package:wolfpack_assessment/models/global.dart';
import 'templates/moment.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: globalGrey,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
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
      title: 'Days',
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: globalGreen,
            title: Text("Days"),
          ),
          body: MomentCard(),
          backgroundColor: globalGrey),
    );
  }
}
