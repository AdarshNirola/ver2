import 'package:intl/intl.dart';
import 'package:ver2/Components/DatalnTable.dart';
import 'package:ver2/Components/StatusContainer.dart';
import 'package:ver2/Models/Chart_Model.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:ver2/Models/BarChart.dart';


class CaseStatus extends StatelessWidget {
  static String id = "CaseStatus";
  String dt = DateFormat('yyyy-MM-dd').format(DateTime.now());
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 14),
      child: Column(

        children: [

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                children: [
                  StatusContainer(child: Image.asset("assets/blue_dot.png"),),
                  Text("Completed",style: TextStyle(fontSize: 16),),
                ],
              ),
              Row(
                children: [
                  StatusContainer(child: Image.asset("assets/green_dot.png"),),
                  Text("in progress",style: TextStyle(fontSize: 16),),
                ],
              ),

              Row(
                children: [
                  StatusContainer(child: Image.asset("assets/yellow_dot.png"),),
                  Text("pending",style: TextStyle(fontSize: 16),),
                ],
              ),Row(
                children: [
                  StatusContainer(child: Image.asset("assets/red_dot.png"),),
                  Text("closed",style: TextStyle(fontSize: 16),),
                ],
              ),
            ],

          ),

          SizedBox(height: 20,),

          SingleChildScrollView(
              scrollDirection: Axis.horizontal,child: Card(child: DataInTable2(dateSent: dt,)))

        ],

      ),
    );
  }
}


