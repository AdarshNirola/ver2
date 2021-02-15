import 'package:ver2/Models/Case.dart';
import 'package:ver2/Screens/detailsScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CaseTile extends StatelessWidget {

  final Case cases;

  const CaseTile({
    this.cases,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(29.0)
      ),
      margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(29),
            gradient: LinearGradient(
                colors: [Color.fromRGBO(110, 85, 202, 1),Color.fromRGBO(181, 81, 194,1)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight
            )
        ),
        child: ListTile(
          title: Text('Case NO. ${cases.case_id.toString()}',style: TextStyle(color: Colors.white),),
          subtitle: Text(cases.assignedto,style: TextStyle(color: Colors.white),),
          onTap: (){
            Navigator.pushNamed(context,DetailsScreen.id);
          },
        ),
      ),
      elevation: 2,
    );
  }
}