import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DoctorLogin {
  final String username, password;
  DoctorLogin({@required this.username, @required this.password});
}

Future<bool> login(String username, String password) async {
  bool canLogin = false;
  await Firestore.instance
      .collection('doctors')
      .getDocuments()
      .then((value) => value.documents.forEach((element) {
            if (element['username'] == username) {
              canLogin = element['password'] == password;
              return;
            }
          }));
  return canLogin;
}
