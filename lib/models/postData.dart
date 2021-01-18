import 'dart:convert';

import 'package:app/models/patient.dart';
import 'package:http/http.dart' as http;

Future<void> postPatient(Patient patient) async {
  return http.post(
    'http://ec2-52-4-221-100.compute-1.amazonaws.com/api/adddata',
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, dynamic>{
      'name': '${patient.firstName} ${patient.lastName} ${patient.middleName}',
      'dob': patient.dateOfBirth,
      'product': patient.product,
      'doses':
          '[{\"date\":"${patient.doses[0].date ?? ''}",\"professional\":"${patient.doses[0].professionalOrClinic ?? ''}"},{\"date\":"${patient.doses[1].date ?? ''}",\"professional\":"${patient.doses[1].professionalOrClinic ?? ''}"}]',
      'patientNumber': patient.patientNumber,
      'password': patient.password
    }),
  );
}
