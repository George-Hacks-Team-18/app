import 'dart:convert';

import 'package:app/components/header.dart';
import 'package:app/components/info_tile.dart';
import 'package:app/components/section.dart';
import 'package:app/components/themed_scaffold.dart';
import 'package:app/components/themed_text.dart';
import 'package:app/globals/app_theme.dart';
import 'package:app/globals/getData.dart';
import 'package:app/models/patient.dart';
import 'package:app/pages/patient/dose_info_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final int patientNumber;
  HomePage({@required this.patientNumber});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: fetchAlbum(),
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done)
          return Scaffold(body: Center(child: CircularProgressIndicator()));
        else if (snapshot.hasError)
          return Text("${snapshot.error}");
        else {
          Patient patient;
          var data = snapshot.data;
          int index;

          for (int i = 0; i < data.length; i++)
            if (data[i]['patientNumber'] == data[index ?? 0]['patientNumber'])
              index = i;

          List<String> names = data[index]['name'].split(' ');
          patient = new Patient(
              firstName: names[0],
              lastName: names[1],
              middleName: names.length > 2 ? names[2] : '',
              dateOfBirth: data[index]['dob'],
              patientNumber: data[index]['patientNumber'].toString(),
              product: data[index]['product']);

          return ThemedScaffold([
            Header(
              'Info',
              showBack: true,
            ),
            SliverList(
                delegate: SliverChildListDelegate([
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: List.generate(
                  2,
                  (i) {
                    var doses = jsonDecode(data[index]['doses']);
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
                                  builder: (c) => DoseInfoPage(
                                    productName: patient.product,
                                    dose: new Dose(
                                        date: doses[i]['date'],
                                        professionalOrClinic: doses[i]
                                            ['professional']),
                                    doseNum: i + 1,
                                  ),
                                )),
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
                  InfoTile(patient.firstName, 'First Name'),
                  InfoTile(patient.lastName, 'Last Name'),
                  InfoTile(patient.middleName, 'Middle Initial'),
                  InfoTile(patient.dateOfBirth, 'Date of Birth'),
                  InfoTile(patient.patientNumber, 'Patient Number'),
                ],
              ),
            ])),
          ]);
        }
      },
    );
  }
}
