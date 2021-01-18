import 'dart:convert';

import 'package:app/components/button.dart';
import 'package:app/components/header.dart';
import 'package:app/components/info_tile.dart';
import 'package:app/components/section.dart';
import 'package:app/components/themed_scaffold.dart';
import 'package:app/components/themed_text.dart';
import 'package:app/components/themed_text_field.dart';
import 'package:app/globals/app_theme.dart';
import 'package:app/globals/getData.dart';
import 'package:app/models/patient.dart';
import 'package:flutter/material.dart';

class DoseInfoPage extends StatelessWidget {
  final Dose dose;
  final int doseNum;
  final String productName;
  DoseInfoPage(
      {@required this.dose,
      @required this.doseNum,
      @required this.productName});

  @override
  Widget build(BuildContext context) {
    return ThemedScaffold([
      Header(
        'Dose $doseNum Info',
        showBack: true,
      ),
      SliverList(
        delegate: SliverChildListDelegate(
          [
            Section(
              title: 'Dose $doseNum',
              children: [
                InfoTile(productName, 'Product Name'),
                // InfoTile(dose.lotNumber, 'Lot Number'),
                InfoTile(dose.date, 'Date'),
                InfoTile(dose.professionalOrClinic, 'Professional'),
              ],
            ),
          ],
        ),
      ),
    ]);
  }
}
