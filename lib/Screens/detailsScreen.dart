import 'package:ver2/Components/TextFieldContainer.dart';
import 'package:ver2/Models/DetailScreenArgument.dart';
import 'package:ver2/Screens/AddRemarks.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'Config.dart';
import 'ModelJoke.dart';

class DetailsScreen extends StatefulWidget {

  static String id = "DetailsPage";

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  final c1 = TextEditingController();
  String remarks = "No remarks";
  @override
  Widget build(BuildContext context) {
    final DetailScreenArgument args = ModalRoute.of(context).settings.arguments;

    Size size = MediaQuery.of(context).size;

    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.grey[300],
      // ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [

                Image.asset("assets/govtofsikkim.png",height: 70,width:70,),
                Text("Govt. Of Sikkim"),
                SizedBox(height: 40,),

                Text("Case Number: ${args.caseId}", style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),),
                SizedBox(height: 30,),

                Container(
                  width: size.width *0.9,
                  child: Card(
                    elevation: 4,
                    child: DataTable(
                        headingRowHeight: 0,
                        columns: <DataColumn>[
                          DataColumn(label: Text("")),
                          DataColumn(label: Text(""))
                        ],
                        rows: <DataRow>[
                          DataRow(
                              cells: <DataCell>[
                                DataCell(Text("Date")),
                                DataCell(Text("${args.date}")),
                              ]
                          ),
                          DataRow(
                              cells: <DataCell>[
                                DataCell(Text("Petionier")),
                                DataCell(Text("${args.petitioner}")),
                              ]
                          ),
                          DataRow(
                              cells: <DataCell>[
                                DataCell(Text("Respondent")),
                                DataCell(Text("${args.respondent}")),
                              ]
                          ),
                          DataRow(
                              cells: <DataCell>[
                                DataCell(Text("Type")),
                                DataCell(Text("${args.caseType}")),
                              ]
                          ),
                          DataRow(
                              cells: <DataCell>[
                                DataCell(Text("Assigned To")),
                                DataCell(Text("${args.assignTo}")),
                              ]
                          ),

                        ]
                    ),
                  ),
                ),

                Container(
                  width: size.width *0.9,
                  child: Card(
                    elevation: 4,
                    child: DataTable(
                        headingRowHeight: 0,
                        columns: <DataColumn>[
                          DataColumn(label: Text("")),
                          DataColumn(label: Text(""))
                        ],
                        rows: <DataRow>[
                          DataRow(
                              cells: <DataCell>[
                                DataCell(Text("Hearing Date")),
                                DataCell(Text("${args.date}")),
                              ]
                          ),
                          DataRow(
                              cells: <DataCell>[
                                DataCell(Text("Status")),
                                DataCell(Text("${args.action}")),
                              ]
                          ),
                        ]
                    ),
                  ),
                ),

                SizedBox(height: 18,),

                Center(child: Text(remarks,style: TextStyle(fontSize: 20),)),

                SizedBox(height: 20,),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.cyan[200],
                      borderRadius: BorderRadius.circular(12)
                  ),
                  child: FlatButton.icon(
                      color: Colors.cyan[200],
                      onPressed: (){
                        showModalBottomSheet(
                            context: context, builder: (context) => Container(

                          color: Color(0xff757575),
                          child: Container(
                            padding: EdgeInsets.only(top: 40, left: 20, right: 20),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(20), topLeft: Radius.circular(20))),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Text(
                                  "add remarks",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30,
                                    color: Colors.grey[700],
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      color: Colors.grey[200],
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 15, top: 10, right: 15, bottom: 10),
                                    child: TextFormField(
                                      controller: c1,
                                      decoration: InputDecoration(border: InputBorder.none),
                                      autofocus: true,
                                      maxLines: 8,
                                      textAlign: TextAlign.left,
                                      onChanged: (newText) {},
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.bottomRight,
                                  child: FlatButton.icon(
                                      color: Colors.grey[200],
                                      onPressed: () {
                                        setState(() {
                                          remarks = c1.text;
                                        });
                                        Navigator.pop(context);
                                      },
                                      icon: Icon(Icons.done),
                                      label: Text("Submit")),
                                )
                              ],
                            ),
                          ),
                        ));
                      },
                      icon: Icon(Icons.edit),
                      label: Text("Remarks")
                  ),
                )


              ],
            ),
          ),
        ),
      ),
    );
  }
}
