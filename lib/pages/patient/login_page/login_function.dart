import 'package:flutter/material.dart';
import 'package:app/globals/getData.dart';

Future<bool> login(
    int patientNumber, String password, BuildContext context) async {
  bool found = false;
  var data = await fetchAlbum();
  for (int i = 0; i < data.length; i++) {
    String storedPass = data[i]['password'];
    int storedNumber = data[i]['patientNumber'];

    if (storedPass == password && storedNumber == patientNumber) {
      found = true;
    }
  }
  return found;
}
