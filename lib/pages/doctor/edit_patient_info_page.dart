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

import 'edit_dose_page.dart';

class EditPatientInfoPage extends StatefulWidget {
  final int patientNumber;
  EditPatientInfoPage(this.patientNumber);

  @override
  _EditPatientInfoPageState createState() => _EditPatientInfoPageState();
}

class _EditPatientInfoPageState extends State<EditPatientInfoPage> {
  bool loading;
  int index;
  Map data;
  TextEditingController firstNameController,
      lastNameController,
      middleInitialController,
      birthDateController;

  @override
  void initState() {
    loading = true;
    load();
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
        loading
            ? SliverFillRemaining(
                child: Center(child: CircularProgressIndicator()))
            : SliverList(
                delegate: SliverChildListDelegate(
                  [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: List.generate(
                        2,
                        (i) {
                          var doses = jsonDecode(data['doses']);
                          if (doses[i]['date'] != '') {
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
                                                index: index,
                                                doseNum: i + 1,
                                              ))),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        "assets/yesvaccineblank.png",
                                        height: 72,
                                      ),
                                      ThemedText(doses[i]['date'],
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
                                          builder: (c) => EditDosePage(
                                              doseNum: i + 1, index: index))),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        "assets/addvaccineblank.png",
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
                        CustomTextField('Last Name',
                            controller: lastNameController),
                        CustomTextField('Middle Initial',
                            controller: middleInitialController),
                        CustomTextField('Date of Birth',
                            controller: birthDateController),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Divider(
                            color: AppTheme.primaryText,
                          ),
                        ),
                        InfoTile(
                            widget.patientNumber.toString(), 'Patient Number'),
                      ],
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 8, right: 8, top: 32),
                      child: SizedBox(
                        width: double.infinity,
                        child: Button(
                          'Save Changes',
                          onPressed: () async {
                            Patient patient = new Patient(
                                firstName: firstNameController.text,
                                lastName: lastNameController.text,
                                middleName: middleInitialController.text,
                                dateOfBirth: birthDateController.text,
                                password: data['password'],
                                product: data['product'],
                                doses: [
                                  new Dose(
                                      date: jsonDecode(data['doses'])[0]
                                          ['date']),
                                  new Dose(
                                      date: jsonDecode(data['doses'])[1]
                                          ['date']),
                                ]);
                            await postPatient(patient);
                            setState(() {
                              loading = true;
                            });
                            Navigator.pop(context);
                            Navigator.pop(context);
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

  void load() async {
    final List album = await fetchAlbum();

    for (int i = 0; i < album.length; i++)
      if (album[i]['patientNumber'] == widget.patientNumber) index = i;

    List<String> names = album[index]['name'].split(' ');

    setState(() {
      data = album[index];
      firstNameController = new TextEditingController(text: names[0]);
      lastNameController = new TextEditingController(text: names[1]);
      middleInitialController =
          new TextEditingController(text: names.length > 2 ? names[2] : '');
      birthDateController =
          new TextEditingController(text: album[index]['dob']);
      loading = false;
    });
  }
}
