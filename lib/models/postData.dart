import 'dart:convert';

import 'package:app/models/patient.dart';
import 'package:http/http.dart' as http;

Future<void> postPatient(Patient patient, List<Dose> doses) async {
  return http.post(
    'http://ec2-52-4-221-100.compute-1.amazonaws.com/api/adddata',
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, dynamic>{
      'name': patient.firstName,
      'dob': patient.dateOfBirth,
      'product': doses[0].productName,
      'date':
          '[{"vax":"${doses.length > 0 ? doses[0].date : ""}"}, {"vax":"${doses.length > 1 ? doses[1].date : ""}"}]',
      'patientNumber': patient.patientNumber
    }),
  );
}
