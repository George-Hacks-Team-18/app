import 'package:app/components/header.dart';
import 'package:app/components/info_tile.dart';
import 'package:app/components/section.dart';
import 'package:app/components/themed_scaffold.dart';
import 'package:app/globals/app_theme.dart';
import 'package:app/models/patient.dart';
import 'package:flutter/material.dart';

class EditDosePage extends StatefulWidget {
  final Dose dose;
  final int doseNum;
  EditDosePage({this.dose, @required this.doseNum});

  @override
  _EditDosePageState createState() => _EditDosePageState();
}

class _EditDosePageState extends State<EditDosePage> {
  Dose dose;

  @override
  Widget build(BuildContext context) {
    return ThemedScaffold([
      Header('Edit Dose Info'),
      SliverToBoxAdapter(
        child: Section(
          title: 'Dose ${widget.doseNum}',
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
        ),
      ),
    ]);
  }
}
