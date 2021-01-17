import 'package:app/pages/doctor/doctor_login_page.dart';
import 'package:app/pages/patient/home_page.dart';
import 'package:app/pages/patient/login_page.dart';
import 'package:app/pages/selection.dart';
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
      home: SelectionPage(),
    );
  }
}
