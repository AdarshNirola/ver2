import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:ver2/Components/StatusContainer.dart';
import 'package:ver2/Models/DetailScreenArgument.dart';
import 'package:ver2/Models/MyCaseList.dart';
import 'package:ver2/Screens/Config.dart';
import 'package:ver2/Screens/detailsScreen.dart';
import 'package:flutter/material.dart';
import '../Screens/ModelJoke.dart';
import 'package:http/http.dart'as http;
import 'dart:convert';

class DataInTable extends StatefulWidget {
  final String dateSent;
  final int caseId;

  const DataInTable({Key key, this.dateSent, this.caseId}) : super(key: key);

  @override
  _DataInTableState createState() => _DataInTableState();
}

class _DataInTableState extends State<DataInTable> {
  static List<ModelJoke> _jokes = List<ModelJoke>();
  static List<ModelJoke> _jokesInApp = List<ModelJoke>();


  Future<List<ModelJoke>> comingJokes() async {
    var url = Config.apiUrl;
    var response = await http.get(url);
    var joke = List<ModelJoke>();

    if (response.statusCode == 200) {
      print("Bhayo ya");
      var notesJson = jsonDecode(response.body);
      for (var notes in notesJson) {
        joke.add(ModelJoke.fromJson(notes));

      }
    } else {
      throw Exception("Failed to load");
    }
    return joke;
  }


  @override
  void initState() {

    // Get the Joke when the App initialize
    comingJokes().then((value) {
      setState(() {
        _jokes.addAll(value);
        _jokesInApp = _jokes;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<ModelJoke> item = [];

    if(widget.caseId == 0){
      print("is 0");
      _jokesInApp.map((items) {
        if(items.date == widget.dateSent){
          item.add(items);
        }
      }).toList();
    }
    else if(widget.dateSent == DateFormat('yyyy-MM-dd').format(DateTime.now()).toString()){
      _jokesInApp.map((items) {
        if(items.caseId == widget.caseId){
          item.add(items);
        }
      }).toList();
    }
    else{
      _jokesInApp.map((items) {
        if(items.date == widget.dateSent && items.caseId == widget.caseId){
          item.add(items);
        }
      }).toList();
    }

    return Container(
      child: Card(
        child: DataTable(
            showCheckboxColumn: false,
            headingRowColor: MaterialStateColor.resolveWith((states) => Color.fromRGBO(167, 208, 251, 1)),
            columns: <DataColumn>[
              DataColumn(label: Text("Case ID",style: TextStyle(color: Colors.black),)),
              DataColumn(label: Text("Petionier",style: TextStyle(color: Colors.black),)),
              DataColumn(label: Text("Respondent",style: TextStyle(color: Colors.black),)),
            ],
            rows: item.map((rowItem) => DataRow(
                onSelectChanged: (bool selected){
                  if(selected){
                    Navigator.pushNamed(context, DetailsScreen.id,arguments: DetailScreenArgument(
                        caseId: rowItem.caseId,
                        petitioner: rowItem.petitioner,
                        serialNo: rowItem.serialNo,
                      assignTo: rowItem.assignTo,
                      action: rowItem.action,
                      caseType: rowItem.caseType,
                      date: rowItem.date,
                      hearingDate: rowItem.hearingDate,
                      officerRmks: rowItem.officerRmks,
                      respondent: rowItem.respondent,
                      peshkarRmks: rowItem.peshkarRmks
                    ));
                  }
                },

                cells: [
                  DataCell(Text(rowItem.caseId.toString())),
                  DataCell(Text(rowItem.petitioner)),
                  DataCell(Text(rowItem.respondent)),

                ]
            )
            ).toList()
        ),
      ),
    );
  }
}




class DataInTable2 extends StatefulWidget {

  final String dateSent;

  const DataInTable2({Key key, this.dateSent}) : super(key: key);

  @override
  _DataInTable2State createState() => _DataInTable2State();
}

class _DataInTable2State extends State<DataInTable2> {

  static List<ModelJoke> _jokes = List<ModelJoke>();
  static List<ModelJoke> _jokesInApp = List<ModelJoke>();


  Future<List<ModelJoke>> comingJokes() async {
    var url = Config.apiUrl;
    var response = await http.get(url);
    var joke = List<ModelJoke>();

    if (response.statusCode == 200) {
      print("Bhayo ya");
      var notesJson = jsonDecode(response.body);
      for (var notes in notesJson) {
        joke.add(ModelJoke.fromJson(notes));

      }
    } else {
      throw Exception("Failed to load");
    }
    return joke;
  }


  @override
  void initState() {

    // Get the Joke when the App initialize
    comingJokes().then((value) {
      setState(() {
        _jokes.addAll(value);
        _jokesInApp = _jokes;
      });
    });
    super.initState();
  }


  @override
  Widget build(BuildContext context) {

    List<ModelJoke> item = [];

    _jokesInApp.map((items) {
      if(items.date == widget.dateSent){
        item.add(items);
      }
    }).toList();

    return DataTable(
        showCheckboxColumn: false,
        columnSpacing: 40,
        headingRowColor: MaterialStateColor.resolveWith((states) => Color.fromRGBO(167, 208, 251, 1)),
        columns: <DataColumn>[
          DataColumn(label: Text("Case ID",style: TextStyle(color: Colors.black),)),
          DataColumn(label: Text("Petionier",style: TextStyle(color: Colors.black),)),
          DataColumn(label: Text("Respondent",style: TextStyle(color: Colors.black),)),
          DataColumn(label: Text("Status",style: TextStyle(color: Colors.black),)),
        ],
        rows: item.map((rowItem) => DataRow(
            onSelectChanged: (bool selected){
              if(selected){
                Navigator.pushNamed(context, DetailsScreen.id,arguments: DetailScreenArgument(caseId: rowItem.caseId,petitioner: rowItem.petitioner));
              }
            },

              cells:
              [

                DataCell(Text(rowItem.caseId.toString())),
                DataCell(Text(rowItem.petitioner)),
                DataCell(Text(rowItem.respondent)),
                DataCell(rowItem.action == "completed" ? StatusContainer(
                  child: Image.asset("assets/blue_dot.png"),)
                    : rowItem.action == "inprogress" ? StatusContainer(
                  child: Image.asset("assets/green_dot.png"),)
                    : rowItem.action == "pending" ? StatusContainer(
                  child: Image.asset("assets/green_dot.png"),)
                    : StatusContainer(
                    child: Image.asset("assets/red_dot.png")),)
              ]

        )
        ).toList()
    );
  }
}