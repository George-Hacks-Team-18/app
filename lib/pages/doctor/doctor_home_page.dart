import 'package:app/components/button.dart';
import 'package:app/components/header.dart';
import 'package:app/components/info_tile.dart';
import 'package:app/components/themed_scaffold.dart';
import 'package:app/components/themed_text.dart';
import 'package:app/components/themed_text_field.dart';
import 'package:app/models/patient.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class DoctorHomePage extends StatefulWidget {
  @override
  _DoctorHomePageState createState() => _DoctorHomePageState();
}

class _DoctorHomePageState extends State<DoctorHomePage> {
  List<Patient> patients, renderPatients;

  @override
  void initState() {
    patients = [
      new Patient(firstName: 'First Name', patientNumber: '14323'),
      new Patient(firstName: 'First Name', patientNumber: '14323'),
      new Patient(firstName: 'First Name', patientNumber: '14323'),
      new Patient(firstName: 'First Name', patientNumber: '14323'),
      new Patient(firstName: 'First Name', patientNumber: '14323'),
      new Patient(firstName: 'First Name', patientNumber: '14323'),
      new Patient(firstName: 'First Name', patientNumber: '14323'),
    ];
    renderPatients = patients;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ThemedScaffold([
      Header('Browse Patients'),
      SliverToBoxAdapter(
        child: ThemedTextField(
            text: 'Search',
            onChanged: (v) => setState(() => renderPatients = newPatients(v))),
      ),
      SliverList(
          delegate: SliverChildBuilderDelegate(
              (c, i) => Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ThemedText(renderPatients[i].firstName),
                            ThemedText(renderPatients[i].patientNumber),
                          ],
                        ),
                      ),
                      Divider()
                    ],
                  ),
              childCount: renderPatients.length))
    ]);
  }

  List<Patient> newPatients(String search) {
    print(search);
    List<Patient> _patients = [];

    for (Patient p in patients)
      if (p.firstName.toLowerCase().contains(search.toLowerCase()) ||
          p.patientNumber.toLowerCase().contains(search.toLowerCase()))
        _patients.add(p);

    return _patients;
  }
}
