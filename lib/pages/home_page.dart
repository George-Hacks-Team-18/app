import 'package:app/components/header.dart';
import 'package:app/components/info_tile.dart';
import 'package:app/components/section.dart';
import 'package:app/components/themed_scaffold.dart';
import 'package:app/components/themed_text.dart';
import 'package:app/globals/app_theme.dart';
import 'package:app/globals/patient_info.dart';
import 'package:app/models/patient.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ThemedScaffold([
      Header('${patient.firstName} ${patient.lastName}'),
      SliverList(
          delegate: SliverChildListDelegate([
        Column(
          children: List.generate(
            2,
            (i) {
              if (patient.doses.length > 1 - i) {
                Dose dose = patient.doses[1 - i];

                return Section(
                  title: 'Dose ${2 - i}',
                  children: [
                    InfoTile(
                      dose.productName,
                      'Product Name',
                      color: AppTheme.secondaryText,
                    ),
                    InfoTile(
                      dose.lotNumber,
                      'Lot Number',
                      color: AppTheme.secondaryText,
                    ),
                    InfoTile(
                      dose.date,
                      'Date',
                      color: AppTheme.secondaryText,
                    ),
                    InfoTile(
                      dose.professionalOrClinic,
                      'Professional or Clinic Site',
                      color: AppTheme.secondaryText,
                    ),
                  ],
                );
              } else {
                return Section(
                  title: 'Dose ${2 - i} not yet administered',
                  color: Color(0xFFFFAC9B),
                );
              }
            },
          ),
        ),
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
