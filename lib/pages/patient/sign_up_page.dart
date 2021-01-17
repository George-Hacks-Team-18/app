import 'package:app/components/button.dart';
import 'package:app/components/header.dart';
import 'package:app/components/themed_scaffold.dart';
import 'package:app/components/themed_text_field.dart';
import 'package:app/globals/app_theme.dart';
import 'package:app/models/patient.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  String firstName,
      lastName,
      middleName,
      dateOfBirth,
      patientNumber,
      password,
      password2;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              Header('Sign Up', showBack: true),
              SliverList(
                delegate: SliverChildListDelegate([
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 32),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        'assets/vaxbanner.png',
                        height: 142,
                      ),
                    ),
                  ),
                  ThemedTextField(
                    text: 'First Name',
                    onChanged: (v) => firstName = v,
                  ),
                  ThemedTextField(
                    text: 'Last Name',
                    onChanged: (v) => lastName = v,
                  ),
                  ThemedTextField(
                    text: 'Middle Initial',
                    onChanged: (v) => middleName = v,
                  ),
                  ThemedTextField(
                    text: 'Date of Birth (MM/DD/YY)',
                    onChanged: (v) => dateOfBirth = v,
                  ),
                  Divider(),
                  ThemedTextField(
                    text: 'Patient Number',
                    onChanged: (v) => patientNumber = v,
                  ),
                  ThemedTextField(
                    text: 'Password',
                    onChanged: (v) => password = v,
                  ),
                  ThemedTextField(
                    text: 'Confirm Password',
                    onChanged: (v) => password2 = v,
                  ),
                  SizedBox(height: 110),
                ]),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: double.infinity,
                child: Button(
                  'Sign Up',
                  onPressed: () => print('sign up'),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
