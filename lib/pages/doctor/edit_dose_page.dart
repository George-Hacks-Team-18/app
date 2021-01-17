import 'package:app/components/button.dart';
import 'package:app/components/header.dart';
import 'package:app/components/info_tile.dart';
import 'package:app/components/section.dart';
import 'package:app/components/themed_scaffold.dart';
import 'package:app/components/themed_text.dart';
import 'package:app/components/themed_text_field.dart';
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
    if (widget.dose == null) {
      nameController = new TextEditingController(text: '');
      numberController = new TextEditingController(text: '');
      dateController = new TextEditingController(text: '');
      professionalController = new TextEditingController(text: '');
    } else {
      nameController = new TextEditingController(text: widget.dose.productName);
      numberController = new TextEditingController(text: widget.dose.lotNumber);
      dateController = new TextEditingController(text: widget.dose.date);
      professionalController =
          new TextEditingController(text: widget.dose.professionalOrClinic);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ThemedScaffold([
      Header(
        widget.dose == null ? 'Add Dose Info' : 'Edit Dose Info',
        showBack: true,
      ),
      SliverList(
        delegate: SliverChildListDelegate(
          [
            Section(
              title: 'Dose ${widget.doseNum}',
              children: [
                CustomTextField('Product Name', controller: nameController),
                CustomTextField('Lot Number', controller: numberController),
                CustomTextField('Date', controller: dateController),
                CustomTextField('Professional',
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
