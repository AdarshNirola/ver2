import 'package:intl/intl.dart';
import 'package:ver2/Components/DatalnTable.dart';
import 'package:ver2/Components/DatePicker.dart';
import 'package:ver2/Components/TextFieldContainer.dart';
import 'package:ver2/Models/Chart_Model.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CaseSearchScreen extends StatefulWidget {
  static String id = "CaseSearchScreen";

  @override
  _CaseSearchScreenState createState() => _CaseSearchScreenState();
}

class _CaseSearchScreenState extends State<CaseSearchScreen> {

  List<String> _choice = ['Date', 'CaseNo'];
  String _selectedChoice = 'Date';
  String dateNow = DateFormat('yyyy-MM-dd').format(DateTime.now());
  DateTime _selectedDate = DateTime.now();
  int tableChange = 0;
  int caseId = 0;
  int caseId1 = 0;

  final c1 = TextEditingController();
  final c2 = TextEditingController();
  final c3 = TextEditingController();

  void _presentDataPicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now().add(Duration(days: 365)),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
        dateNow = DateFormat('yyyy-MM-dd').format(_selectedDate);
      });
    });

  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          SizedBox(height: 40,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [

              _selectedChoice == 'Date' ? Row(
                children: [
                  Container(
                      height: 50,
                      width: size.width*0.47,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(12), bottomLeft: Radius.circular(12)),
                      ),
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        controller: c1,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "CaseNo. or use Date->",hintStyle: TextStyle(
                            fontSize: 12
                        ),
                          icon: GestureDetector(
                              onTap: (){
                                setState(() {
                                  caseId = int.parse(c1.text);
                                  print(c1.text);
                                });
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(Icons.search),
                              )
                          ),
                        ),
                      )
                  ),

                  Container(
                    height: 50,
                    width: size.width*0.14,
                    decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.only(topRight: Radius.circular(12),bottomRight: Radius.circular(12))
                    ),
                    child: FlatButton(
                      textColor: Theme.of(context).primaryColor,
                      child: Icon(Icons.date_range,size: 25,color: Colors.grey[600],),
                      onPressed:_presentDataPicker,
                    ),
                  )

                ],
              ) : Container(
                child: TextFieldContainer(child: TextFormField(
                  keyboardType: TextInputType.number,
                  controller: c2,
                  autofocus: false,

                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Case Number",hintStyle: TextStyle(fontSize: 12),
                    icon: GestureDetector(
                        onTap: (){
                          setState(() {
                            caseId1 = int.parse(c2.text);
                            print(c2.text);
                          });
                        },
                        child: Icon(Icons.search)
                    ),
                  ),
                )
                ),
              ),

              DropdownButton<String>(
                elevation: 12,
                value: _selectedChoice,
                onChanged: (value){
                  setState(() {
                    _selectedChoice = value;
                  });
                },
                items: _choice.map<DropdownMenuItem<String>>((value){
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              )

            ],
          ),

          SizedBox(height: 20,),

          Center(child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Card(child: _selectedChoice == 'Date' ? DataInTable(dateSent: dateNow,caseId: caseId,) : DataInTable(dateSent: dateNow,caseId: caseId1,)))
          ),

        ],
      ),
    );
  }
}

class CaseSearchField extends StatelessWidget {
  const CaseSearchField({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFieldContainer(child: TextField(
        onChanged:(value){
          //code for input changes store
        },
        autofocus: false,

        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: "Case Number",hintStyle: TextStyle(fontSize: 12),
          icon: GestureDetector(
              onTap: (){
                print("Button tapped");
              },
              child: Icon(Icons.search)
          ),
        ),
      )
      ),
    );
  }
}
