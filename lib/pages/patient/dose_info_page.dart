import 'package:app/components/header.dart';
import 'package:app/components/info_tile.dart';
import 'package:app/components/section.dart';
import 'package:app/components/themed_scaffold.dart';
import 'package:app/globals/app_theme.dart';
import 'package:app/models/patient.dart';
import 'package:flutter/material.dart';

class DoseInfoPage extends StatelessWidget {
  final int doseNum;
  final Dose dose;
  DoseInfoPage(this.doseNum, this.dose);

  @override
  Widget build(BuildContext context) {
    return ThemedScaffold(
      [
        Header(
          'Dose $doseNum',
          showBack: true,
        ),
        SliverToBoxAdapter(
          child: Section(
            title: 'Dose $doseNum',
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
                'Professional',
                color: AppTheme.secondaryText,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
