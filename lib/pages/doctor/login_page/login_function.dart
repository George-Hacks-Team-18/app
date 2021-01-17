import 'package:app/models/parse_json.dart';
import 'package:flutter/material.dart';

class DoctorLogin {
  final String username, password;
  DoctorLogin({@required this.username, @required this.password});
}

Future<bool> login(
    String username, String password, BuildContext context) async {
  List<DoctorLogin> patients = [];
  List json = await getJSONfromFile(context, 'doctor_accounts');

  json.forEach((p) => patients
      .add(new DoctorLogin(username: p['username'], password: p['password'])));

  bool found = false;
  patients.forEach((p) {
    if (p.username == username) {
      if (p.password == password)
        found = true;
      else
        found = false;
      return;
    }
  });

  return found;
}
