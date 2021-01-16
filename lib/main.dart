import 'package:app/pages/doctor/doctor_login_page.dart';
import 'package:app/pages/home_page.dart';
import 'package:app/pages/login_page.dart';
import 'package:flutter/material.dart';

import 'globals/app_theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vaxified',
      theme: ThemeData(
        primaryColor: AppTheme.primary,
      ),
      home: DoctorLoginPage(),
    );
  }
}
