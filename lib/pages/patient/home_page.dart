import 'package:app/components/header.dart';
import 'package:app/components/info_tile.dart';
import 'package:app/components/section.dart';
import 'package:app/components/themed_scaffold.dart';
import 'package:app/components/themed_text.dart';
import 'package:app/globals/app_theme.dart';
import 'package:app/globals/patient_info.dart';
import 'package:app/models/patient.dart';
import 'package:app/pages/patient/dose_info_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ThemedScaffold([
      Header(
        'Info',
        showBack: true,
      ),
      SliverList(
          delegate: SliverChildListDelegate([
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(
            2,
            (i) {
              if (patient.doses.length > i) {
                Dose dose = patient.doses[i];

                return Container(
                  height: 72,
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: FlatButton(
                    color: AppTheme.primary,
                    onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (c) => DoseInfoPage(i, dose))),
                    child: Container(),
                  ),
                );
              } else {
                return Container(
                  height: 72,
                  width: MediaQuery.of(context).size.width * 0.4,
                  color: Color(0xFFFFAC9B),
                );
              }
            },
          ),
        ),
        SizedBox(height: 16),
        Section(
          title: 'Patient Info',
          color: AppTheme.lightGray,
          children: [
            InfoTile(patient.firstName, 'First Name'),
            InfoTile(patient.lastName, 'Last Name'),
            InfoTile(patient.middleName, 'Middle Name'),
            InfoTile(patient.dateOfBirth, 'Date of Birth'),
            InfoTile(patient.patientNumber, 'Patient Number'),
          ],
        ),
      ])),
    ]);
  }
}
