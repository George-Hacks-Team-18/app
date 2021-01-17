import 'package:app/components/button.dart';
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
    lastNameController = new TextEditingController(text: patient.firstName);
    middleInitialController =
        new TextEditingController(text: patient.firstName);
    birthDateController = new TextEditingController(text: patient.firstName);
    patientNumController = new TextEditingController(text: patient.firstName);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
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
                                          builder: (c) =>
                                              DoseInfoPage(i + 1, dose))),
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
                                color: AppTheme.red,
                                child: Column(
                                  children: [
                                    Image.asset("assets/novaccineblank.png",
                                        height: 72),
                                    ThemedText("Dose ${i + 1}",
                                        color: AppTheme.buttonText)
                                  ],
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
                        EditInfoTile('First Name',
                            controller: firstNameController),
                        EditInfoTile('Last Name',
                            controller: lastNameController),
                        EditInfoTile('Middle Initial',
                            controller: middleInitialController),
                        EditInfoTile('Date of Birth',
                            controller: birthDateController),
                        EditInfoTile('Patient Number',
                            controller: patientNumController),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
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
          )
        ],
      ),
    );
  }
}
