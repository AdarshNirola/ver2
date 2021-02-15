import 'package:flutter/cupertino.dart';

class MyCaseList{

  final int Caseid;
  final String petionier;
  final String CaseDetails;
  final int status;

  MyCaseList({
    @required this.Caseid,
    @required this.petionier,
    @required this.CaseDetails,
    this.status
  });


}