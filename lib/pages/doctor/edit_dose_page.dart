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
import 'package:flutter/material.dart';

class EditDosePage extends StatefulWidget {
  final int doseNum, index;
  EditDosePage({@required this.doseNum, @required this.index});

  @override
  _EditDosePageState createState() => _EditDosePageState();
}

class _EditDosePageState extends State<EditDosePage> {
  bool loading, hasDose;
  TextEditingController nameController,
      numberController,
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
                // CustomTextField('Professional', controller: professionalController),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8, right: 8, top: 32),
              child: SizedBox(
                width: double.infinity,
                child: Button(
                  hasDose == null ? 'Add Dose Info' : 'Save Changes',
                  onPressed: () {},
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
    var date = jsonDecode(data['date']);

    if (date[widget.doseNum - 1]['vax'] == '') {
      setState(() {
        nameController = new TextEditingController(text: '');
        // numberController = new TextEditingController(text: '');
        dateController = new TextEditingController(text: '');
        // professionalController = new TextEditingController(text: '');
        loading = false;
      });
      return;
    } else {
      setState(() {
        nameController = new TextEditingController(text: data['product']);
        // numberController = new TextEditingController(text: '');
        dateController =
            new TextEditingController(text: date[widget.doseNum - 1]['vax']);
        // professionalController = new TextEditingController(text: '');
        loading = false;
      });
      return;
    }
  }
}
