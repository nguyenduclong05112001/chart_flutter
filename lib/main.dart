import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

void main() {
  return runApp(_ChartApp());
}

class _ChartApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
      debugShowCheckedModeBanner: false,
      home: const _MyHomePage(),
    );
  }
}

class _MyHomePage extends StatefulWidget {
  const _MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<_MyHomePage> {
  List<LiveData> data = [
    LiveData(
        'period 1',
        [
          Note("note 1", 1),
          Note("note 2", 2),
          Note("note 3", 1),
          Note("note 4", 2),
          Note("note 5", 3),
        ],
        9),
    LiveData(
        'period 2',
        [
          Note("note 1", 2),
          Note("note 2", 2),
          Note("note 3", 1),
          Note("note 4", 2),
          Note("note 5", 3),
          Note("note 6", 3),
          Note("note 7", 2),
          Note("note 8", 3),
        ],
        7.6),
    LiveData(
        'period 3',
        [
          Note("note 1", 1),
          Note("note 2", 2),
          Note("note 3", 1),
          Note("note 4", 2),
          Note("note 5", 3),
          Note("note 6", 3),
          Note("note 7", 3),
        ],
        8.8),
    LiveData(
        'period 4',
        [
          Note("note 1", 2),
          Note("note 2", 2),
          Note("note 3", 1),
          Note("note 4", 2),
          Note("note 5", 3),
          Note("note 6", 3),
          Note("note 7", 2),
          Note("note 8", 3),
          Note("note 9", 3),
          Note("note 10", 3),
          Note("note 11", 3),
        ],
        7.9),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My App'),
      ),
      body: SfCartesianChart(
        primaryXAxis: CategoryAxis(),
        title: ChartTitle(text: "this is test chart flutter"),
        legend: Legend(isVisible: true),
        series: <ChartSeries>[
          StackedColumnSeries<LiveData, String>(
            dataSource: data,
            xValueMapper: (LiveData item, _) => item.period,
            yValueMapper: (LiveData item, _) {
              var numNote = 0;
              for (var element in item.notes) {
                if (element.status == 1) {
                  numNote++;
                }
              }
              return numNote;
            },
            color: Colors.red,
            name: "Bad",
          ),
          StackedColumnSeries<LiveData, String>(
            dataSource: data,
            xValueMapper: (LiveData item, _) => item.period,
            yValueMapper: (LiveData item, _) {
              var numNote = 0;
              for (var element in item.notes) {
                if (element.status == 2) {
                  numNote++;
                }
              }
              return numNote;
            },
            color: Colors.green,
            name: "Good",
          ),
          StackedColumnSeries<LiveData, String>(
            dataSource: data,
            xValueMapper: (LiveData item, _) => item.period,
            yValueMapper: (LiveData item, _) {
              var numNote = 0;
              for (var element in item.notes) {
                if (element.status == 3) {
                  numNote++;
                }
              }
              return numNote;
            },
            color: Colors.yellow,
            name: "Quite",
          ),
        ],
      ),
    );
  }
}

class LiveData {
  final String period;
  final List<Note> notes;
  final double point;

  LiveData(this.period, this.notes, this.point);
}

class Note {
  final String content;
  final int status;

  Note(this.content, this.status);
}
