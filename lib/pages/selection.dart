import 'package:app/components/button.dart';
import 'package:app/components/header.dart';
import 'package:app/components/themed_text.dart';
import 'package:flutter/material.dart';

class SelectionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        Header("Welcome"),
        SliverList(
            delegate: SliverChildListDelegate(
          [
            Image.asset("assets/vaxifiedicon.png"),
            Padding(
                padding: EdgeInsets.all(10),
                child: Button(
                  "I'm a Patient",
                  onPressed: () {},
                )),
            Padding(
              padding: EdgeInsets.all(10),
              child: Button(
                "I'm a Healthcare Professional",
                onPressed: () {},
              ),
            ),
          ],
        ))
      ],
    ));
  }
}
