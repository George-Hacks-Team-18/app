import 'package:app/components/button.dart';
import 'package:app/components/header.dart';
import 'package:app/components/info_tile.dart';
import 'package:app/components/section.dart';
import 'package:app/components/themed_scaffold.dart';
import 'package:app/components/themed_text.dart';
import 'package:app/components/themed_text_field.dart';
import 'package:app/globals/app_theme.dart';
import 'package:app/globals/patient_info.dart';
import 'package:app/models/patient.dart';
import 'package:flutter/material.dart';

import 'edit_dose_page.dart';

class EditPatientInfoPage extends StatefulWidget {
  @override
  _EditPatientInfoPageState createState() => _EditPatientInfoPageState();
}

class _EditPatientInfoPageState extends State<EditPatientInfoPage> {
  TextEditingController firstNameController,
      lastNameController,
      middleInitialController,
      birthDateController,
      patientNumController;

  @override
  void initState() {
    firstNameController = new TextEditingController(text: patient.firstName);
    lastNameController = new TextEditingController(text: patient.lastName);
    middleInitialController =
        new TextEditingController(text: patient.middleName);
    birthDateController = new TextEditingController(text: patient.dateOfBirth);
    patientNumController =
        new TextEditingController(text: patient.patientNumber);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ThemedScaffold(
      [
        Header(
          'Edit Patient Info',
          showBack: true,
        ),
        SliverList(
          delegate: SliverChildListDelegate(
            [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: List.generate(
                  2,
                  (i) {
                    if (patient.doses.length > i) {
                      Dose dose = patient.doses[i];

                      return ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Container(
                          height: 100,
                          width: MediaQuery.of(context).size.width * 0.4,
                          child: TextButton(
                            style: TextButton.styleFrom(
                                backgroundColor: AppTheme.primary,
                                padding: EdgeInsets.zero),
                            onPressed: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (c) => EditDosePage(
                                        doseNum: i + 1, dose: dose))),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  "assets/yesvaccineblank.png",
                                  height: 72,
                                ),
                                ThemedText(dose.date,
                                    color: AppTheme.buttonText)
                              ],
                            ),
                          ),
                        ),
                      );
                    } else {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Container(
                          height: 100,
                          width: MediaQuery.of(context).size.width * 0.4,
                          child: TextButton(
                            style: TextButton.styleFrom(
                                backgroundColor: AppTheme.red,
                                padding: EdgeInsets.zero),
                            onPressed: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (c) =>
                                        EditDosePage(doseNum: i + 1))),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  "assets/novaccineblank.png",
                                  height: 72,
                                ),
                                ThemedText('Dose ${i + 1}',
                                    color: AppTheme.buttonText)
                              ],
                            ),
                          ),
                        ),
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
                  CustomTextField('First Name',
                      controller: firstNameController),
                  CustomTextField('Last Name', controller: lastNameController),
                  CustomTextField('Middle Initial',
                      controller: middleInitialController),
                  CustomTextField('Date of Birth',
                      controller: birthDateController),
                  CustomTextField('Patient Number',
                      controller: patientNumController),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8, right: 8, top: 32),
                child: SizedBox(
                  width: double.infinity,
                  child: Button(
                    'Save Changes',
                    onPressed: () {
                      print(firstNameController.text);
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
