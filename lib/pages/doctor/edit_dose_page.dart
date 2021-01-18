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
import 'package:app/models/postData.dart';
import 'package:flutter/material.dart';

class EditDosePage extends StatefulWidget {
  final int doseNum, index;
  EditDosePage({@required this.doseNum, @required this.index});

  @override
  _EditDosePageState createState() => _EditDosePageState();
}

class _EditDosePageState extends State<EditDosePage> {
  bool loading, hasDose;
  Patient patient;
  TextEditingController nameController,
      // numberController,
      dateController,
      professionalController;

  @override
  void initState() {
    loading = true;
    load();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ThemedScaffold([
      Header(
        hasDose == null ? 'Add Dose Info' : 'Edit Dose Info',
        showBack: true,
      ),
      SliverList(
        delegate: SliverChildListDelegate(
          [
            Section(
              title: 'Dose ${widget.doseNum}',
              children: [
                CustomTextField('Product Name', controller: nameController),
                // CustomTextField('Lot Number', controller: numberController),
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
                  hasDose == null ? 'Add Dose Info' : 'Save Changes',
                  onPressed: () async {
                    patient.product = nameController.text;
                    patient.doses[widget.doseNum - 1] = new Dose(
                        date: dateController.text,
                        professionalOrClinic: professionalController.text);

                    await postPatient(patient);
                    setState(() {
                      loading = true;
                    });
                    load();
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    ]);
  }

  void load() async {
    final List album = await fetchAlbum();
    Map data = album[widget.index];
    var doses = jsonDecode(data['doses']);

    List<String> names = data['name'].split(' ');
    patient = new Patient(
        firstName: names[0],
        lastName: names[1],
        middleName: names.length > 2 ? names[2] : '',
        dateOfBirth: data['dob'],
        product: data['product'],
        patientNumber: data['patientNumber'].toString(),
        password: data['password'],
        doses: [
          new Dose(
              date: doses[0]['date'],
              professionalOrClinic: doses[0]['professional']),
          new Dose(
              date: doses[1]['date'],
              professionalOrClinic: doses[1]['professional']),
        ]);

    if (doses[widget.doseNum - 1]['date'] == '') {
      setState(() {
        nameController = new TextEditingController(text: data['product'] ?? '');
        // numberController = new TextEditingController(text: '');
        dateController = new TextEditingController(text: '');
        professionalController = new TextEditingController(text: '');
        loading = false;
      });
      return;
    } else {
      setState(() {
        nameController = new TextEditingController(text: data['product']);
        // numberController = new TextEditingController(text: '');
        dateController =
            new TextEditingController(text: doses[widget.doseNum - 1]['date']);
        professionalController = new TextEditingController(
            text: doses[widget.doseNum - 1]['professional']);
        loading = false;
      });
      return;
    }
  }
}
