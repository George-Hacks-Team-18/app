import 'package:app/components/button.dart';
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
  TextEditingController nameController,
      numberController,
      dateController,
      professionalController;

  @override
  void initState() {
    nameController = new TextEditingController(text: widget.dose.productName);
    numberController = new TextEditingController(text: widget.dose.lotNumber);
    dateController = new TextEditingController(text: widget.dose.date);
    professionalController =
        new TextEditingController(text: widget.dose.professionalOrClinic);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ThemedScaffold([
      Header(
        'Edit Dose Info',
        showBack: true,
      ),
      SliverList(
        delegate: SliverChildListDelegate(
          [
            Section(
              title: 'Dose ${widget.doseNum}',
              children: [
                EditInfoTile('Product Name', controller: nameController),
                EditInfoTile('Lot Number', controller: numberController),
                EditInfoTile('Date', controller: dateController),
                EditInfoTile('Professional',
                    controller: professionalController),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8, right: 8, top: 32),
              child: SizedBox(
                width: double.infinity,
                child: Button(
                  'Save Changes',
                  onPressed: () {},
                ),
              ),
            ),
          ],
        ),
      ),
    ]);
  }
}
