class ModelJoke{
  String petitioner;
  int serialNo;
  String action;
  String respondent;
  String caseType;
  int caseId;
  String assignTo;
  String peshkarRmks;
  String date;
  String officerRmks;
  String hearingDate;

  ModelJoke(
      {this.petitioner,
        this.serialNo,
        this.action,
        this.respondent,
        this.caseType,
        this.caseId,
        this.assignTo,
        this.peshkarRmks,
        this.date,
        this.officerRmks,
        this.hearingDate});

  ModelJoke.fromJson(Map<String, dynamic> json) {
    petitioner = json['petitioner'];
    serialNo = json['serial_no'];
    action = json['action'];
    respondent = json['respondent'];
    caseType = json['case_type'];
    caseId = json['case_id'];
    assignTo = json['assign_to'];
    peshkarRmks = json['peshkar_rmks'];
    date = json['date'];
    officerRmks = json['officer_rmks'];
    hearingDate = json['hearing_date'];
  }



  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['petitioner'] = this.petitioner;
    data['serial_no'] = this.serialNo;
    data['action'] = this.action;
    data['respondent'] = this.respondent;
    data['case_type'] = this.caseType;
    data['case_id'] = this.caseId;
    data['assign_to'] = this.assignTo;
    data['peshkar_rmks'] = this.peshkarRmks;
    data['date'] = this.date;
    data['officer_rmks'] = this.officerRmks;
    data['hearing_date'] = this.hearingDate;
    return data;
  }
}

