import 'package:flutter/cupertino.dart';
import 'package:ver2/Components/DatalnTable.dart';
import 'package:ver2/Models/BarChart.dart';
import 'package:ver2/Models/Chart_Model.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
class MyCase extends StatelessWidget {
  static String id = "MyCase";
  final List<Chart_Model> data = [
    Chart_Model(no_of_cases: 4, days: "Mon", barColor: charts.ColorUtil.fromDartColor(Colors.blue)),
    Chart_Model(no_of_cases: 8, days: "Tues", barColor: charts.ColorUtil.fromDartColor(Colors.red)),
    Chart_Model(no_of_cases: 6, days: "Wed", barColor: charts.ColorUtil.fromDartColor(Colors.black)),
    Chart_Model(no_of_cases: 2, days: "Thur", barColor: charts.ColorUtil.fromDartColor(Colors.purpleAccent)),
    Chart_Model(no_of_cases: 9, days: "Fri", barColor: charts.ColorUtil.fromDartColor(Colors.green)),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(

      children: [

        SizedBox(height: 20,),

        Card(
          elevation: 8,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          child: ListTile(
            leading: CircleAvatar(
              radius: 32.0,
              backgroundColor: Color.fromRGBO(167, 208, 251, 1),
              child: Icon(Icons.bookmark_border),
            ),
            title: Text("State District Magistrate",style: TextStyle(fontSize: 24),),
            subtitle: Container(
              margin: EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Today's Cases: 5"),
                  Text("District")
                ],
              ),
            ),
          ),
        ),

        Center(child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Card(
                elevation: 3,
                child: BarChart(data: data,))
        )
        ),

      ],

    );
  }
}




