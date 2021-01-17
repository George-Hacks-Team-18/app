import 'package:app/components/button.dart';
import 'package:app/components/header.dart';
import 'package:app/components/themed_text.dart';
import 'package:app/pages/patient/login_page.dart';
import 'package:flutter/material.dart';

import 'doctor/doctor_login_page.dart';

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
              child: SizedBox(
                height: 150,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    "assets/vaxbanner.png",
                  ),
                ),
              ),
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
                  "I'm a Healthcare Professional",
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
