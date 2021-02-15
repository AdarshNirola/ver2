import 'package:ver2/Screens/MyCase.dart';

class Case{
  final int case_id;
  // final DateTime date;
  final String petionier;
  final String respondent;
  final String assignedto;
  final String remarks;
  bool isDone;

  // ignore: non_constant_identifier_names
  Case({this.case_id, this.petionier,this.respondent,this.assignedto,this.remarks, this.isDone = false});

  void casedone(){
    isDone = !isDone;
  }
}