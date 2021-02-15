import 'package:ver2/Models/Chart_Model.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class BarChart extends StatelessWidget {

  final List<Chart_Model> data;

  const BarChart({this.data});

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    List<charts.Series<Chart_Model,String>> series = [
      charts.Series(
          id: "days",
          data: data,
          domainFn: (Chart_Model series, _) => series.days,
          measureFn: (Chart_Model series, _) => series.no_of_cases,
          colorFn: (Chart_Model series, _) => series.barColor
      )
    ];

    return Container(
      height: 400,
      width: size.width*0.9,
      padding: EdgeInsets.all(20),
      child: Card(
        elevation: 8,
        child: Column(
          children: [
            Text("Cases Per Day",style: TextStyle(fontWeight: FontWeight.bold)),
            Expanded(child: charts.BarChart(series,animate: true,),)
          ],
        ),
      ),
    );
  }
}
