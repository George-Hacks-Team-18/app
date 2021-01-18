import 'package:app/components/button.dart';
import 'package:app/components/header.dart';
import 'package:app/components/info_tile.dart';
import 'package:app/components/themed_scaffold.dart';
import 'package:app/components/themed_text.dart';
import 'package:app/components/themed_text_field.dart';
import 'package:app/globals/getData.dart';
import 'package:app/models/patient.dart';
import 'package:app/pages/doctor/edit_patient_info_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class DoctorHomePage extends StatefulWidget {
  @override
  _DoctorHomePageState createState() => _DoctorHomePageState();
}

class _DoctorHomePageState extends State<DoctorHomePage> {
  List<Patient> patients, renderPatients;
  bool loading;

  @override
  void initState() {
    loading = true;
    loadPatients();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ThemedScaffold([
      Header(
        'Browse Patients',
        showBack: true,
      ),
      SliverToBoxAdapter(
        child: ThemedTextField(
            text: 'Search',
            onChanged: (v) => setState(() => renderPatients = newPatients(v))),
      ),
      loading
          ? SliverFillRemaining(
              child: Center(child: CircularProgressIndicator()))
          : SliverList(
              delegate: SliverChildBuilderDelegate(
                  (c, i) => Column(
                        children: [
                          TextButton(
                            onPressed: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (c) => EditPatientInfoPage(
                                        int.parse(
                                            renderPatients[i].patientNumber)))),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  ThemedText(
                                      '${renderPatients[i].lastName}, ${renderPatients[i].firstName} ${renderPatients[i].middleName}'),
                                  ThemedText(renderPatients[i].patientNumber),
                                ],
                              ),
                            ),
                          ),
                          Divider()
                        ],
                      ),
                  childCount: renderPatients.length))
    ]);
  }

  List<Patient> newPatients(String search) {
    List<Patient> _patients = [];
    search = search.toLowerCase();

    for (Patient p in patients) {
      String name =
              '${p.lastName}, ${p.firstName} ${p.middleName}'.toLowerCase(),
          name2 = '${p.firstName} ${p.lastName}'.toLowerCase();
      if (name.contains(search) ||
          name2.contains(search) ||
          p.patientNumber.toLowerCase().contains(search)) _patients.add(p);
    }

    return _patients;
  }

  void loadPatients() async {
    List<Patient> _patients = [];
    final album = await fetchAlbum();

    Map<int, int> ps = new Map();
    for (int i = 0; i < album.length; i++)
      if (album[i]['patientNumber'] != null) ps[album[i]['patientNumber']] = i;

    ps.forEach((n, i) {
      print(i);
      List<String> names = album[i]['name'].split(' ');

      _patients.add(
        new Patient(
            firstName: names[0],
            lastName: names[1],
            middleName: names.length > 2 ? names[2] : '',
            patientNumber: album[i]['patientNumber'].toString(),
            index: i),
      );
    });

    setState(() {
      patients = _patients;
      renderPatients = patients;
      loading = false;
    });
  }
}
