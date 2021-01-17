import 'dart:convert';

import 'package:app/components/header.dart';
import 'package:app/components/info_tile.dart';
import 'package:app/components/section.dart';
import 'package:app/components/themed_scaffold.dart';
import 'package:app/components/themed_text.dart';
import 'package:app/globals/app_theme.dart';
import 'package:app/globals/getData.dart';
import 'package:app/globals/patient_info.dart';
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

          for (var i = 0; i < data.length; i++) {
            if (data[i]['patientNumber'] == patientNumber) {
              index = i;
              List<String> names = data[i]['name'].split(' ');
              patient = new Patient(
                firstName: names[0],
                lastName: names[1],
                middleName: names.length > 2 ? names[2] : '',
                dateOfBirth: data[i]['dob'],
                patientNumber: data[i]['patientNumber'].toString(),
              );
            }
          }

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
                    var date = jsonDecode(data[index]['date']);
                    print(date[i]['vax']);
                    if (date[i]['vax'] != "") {
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
                                        DoseInfoPage(i + 1, date[i]['vax']))),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  "assets/yesvaccineblank.png",
                                  height: 72,
                                ),
                                ThemedText(date[i]['vax'],
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
                  InfoTile(patient.middleName, 'MiddleInitial'),
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
