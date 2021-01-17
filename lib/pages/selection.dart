import 'package:app/components/button.dart';
import 'package:app/components/header.dart';
import 'package:app/components/info_tile.dart';
import 'package:app/components/section.dart';
import 'package:app/components/themed_text.dart';
import 'package:app/globals/app_theme.dart';
import 'package:app/pages/patient/login_page/login_page.dart';
import 'package:flutter/material.dart';

import 'doctor/login_page/doctor_login_page.dart';

class SelectionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: CustomScrollView(
      physics: NeverScrollableScrollPhysics(),
      slivers: [
        Header("Welcome"),
        SliverFillRemaining(
            child: Column(
          children: [
            SizedBox(height: 56),
            Padding(
              padding: const EdgeInsets.all(12),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  "assets/vaxbanner.png",
                ),
              ),
            ),
            Section(
              title: 'Welcome to Vaxified!',
              color: AppTheme.lightGray,
              children: [
                Padding(
                    padding: EdgeInsets.all(10),
                    child: ThemedText(
                        "Securely record and access administered COVID-19 vaccinations"))
              ],
            ),
            Expanded(child: Container()),
            SizedBox(
              width: double.infinity,
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Button("I'm a Patient",
                    onPressed: () => Navigator.push(context,
                        MaterialPageRoute(builder: (c) => LoginPage()))),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Button(
                  "I'm a Medical Professional",
                  onPressed: () => Navigator.push(context,
                      MaterialPageRoute(builder: (c) => DoctorLoginPage())),
                ),
              ),
            ),
          ],
        ))
      ],
    )));
  }
}
