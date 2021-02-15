import 'dart:convert';

import 'package:flutter/material.dart';
import 'Config.dart';
import 'ModelJoke.dart';
import 'package:http/http.dart' as http;
import 'detailsScreen.dart';
import 'package:ver2/Components/StatusContainer.dart';
import 'package:ver2/Models/DetailScreenArgument.dart';
import 'package:ver2/Models/MyCaseList.dart';
import 'package:ver2/Screens/detailsScreen.dart';

class CaseList extends StatefulWidget {
  @override
  _CaseListState createState() => _CaseListState();
}

class _CaseListState extends State<CaseList> {
  //Swipe to Refresh
  Color gradientStart = Colors.white10;
  Color gradientEnd = Color.fromRGBO(201, 226, 252, 1);
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
  GlobalKey<RefreshIndicatorState>();

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

  // Pull to refresh and get New Jokes
  Future<Null> _refresh() {
    // Clear the old data
    _jokes.clear();
    //Add the new data
    return comingJokes().then((value) {
      setState(() {
        _jokes.addAll(value);
        _jokesInApp = _jokes;
      });
    });
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



  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 255, 255, .9),
      body: Container(
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
//      itemCount: 10,
          itemBuilder: (context, index) {
            return Card(
              elevation: 7.0,
              margin: new EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [gradientStart, gradientEnd],
                      begin: FractionalOffset(0, 0),
                      end: FractionalOffset(0, 1),
                      stops: [0.0, 1.0],
                      tileMode: TileMode.clamp),
                ),
                child: ListTile(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 16.0, vertical: 6.0),
                    title: Text(
                      "Case ID:${_jokesInApp[index].caseId.toString()}",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),

                    //subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

                    subtitle: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(_jokesInApp[index].date,
                            style: TextStyle(color: Colors.black)),
                        Text(_jokesInApp[index].petitioner,
                            style: TextStyle(color: Colors.black)),
                        Text(_jokesInApp[index].respondent,
                            style: TextStyle(color: Colors.black))
                      ],
                    ),
                    trailing: Container(
                        child: new IconButton(
                            icon: new Icon(Icons.keyboard_arrow_right,
                                color: Colors.black, size: 30.0),
                            onPressed: () {
                              Navigator.pushNamed(context, DetailsScreen.id,
                                  arguments: DetailScreenArgument(
                                      caseId:
                                          _jokesInApp[index].caseId,
                                      petitioner: _jokesInApp[index].petitioner,
                                      serialNo: _jokesInApp[index].serialNo,
                                      action: _jokesInApp[index].action,
                                      respondent: _jokesInApp[index].respondent,
                                      caseType: _jokesInApp[index].caseType,
                                      assignTo:_jokesInApp[index].assignTo,
                                      peshkarRmks: _jokesInApp[index].peshkarRmks,
                                      date: _jokesInApp[index].date,
                                      officerRmks: _jokesInApp[index].officerRmks,
                                      hearingDate: _jokesInApp[index].hearingDate

                                  ));
                            }))),
              ),
            );
          },
          itemCount: _jokesInApp.length,
        ),
      ),
    );
  }
}
