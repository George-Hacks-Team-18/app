import 'package:app/models/parse_json.dart';
import 'package:flutter/material.dart';

class PatientLogin {
  final int patientNumber;
  final String password;
  PatientLogin({@required this.patientNumber, @required this.password});
}

Future<bool> login(
    int patientNumber, String password, BuildContext context) async {
  List<PatientLogin> patients = [];
  List json = await getJSONfromFile(context, 'accounts');

  json.forEach((p) => patients.add(new PatientLogin(
      patientNumber: p['patientNumber'], password: p['password'])));

  bool found = false;
  patients.forEach((p) {
    if (p.patientNumber == patientNumber) {
      if (p.password == password)
        found = true;
      else
        found = false;
      return;
    }
  });

  return found;
}
