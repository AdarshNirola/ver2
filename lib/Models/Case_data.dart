import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:ver2/Models/Case.dart';

class CaseData extends ChangeNotifier{

  List<Case> _cases = [
    Case(case_id: 12,assignedto: "Arima",petionier: "Koiser",remarks: "dsasdasd", respondent: "dasasdasd"),
    Case(case_id: 12,assignedto: "Kaizen",petionier: "Dally",remarks: "dsasdasd", respondent: "dasasdasd"),
    Case(case_id: 12,assignedto: "Rahul",petionier: "thakur",remarks: "dsasdasd", respondent: "dasasdasd"),
  ];


  UnmodifiableListView<Case> get cases {
    return UnmodifiableListView(_cases);
  }

}