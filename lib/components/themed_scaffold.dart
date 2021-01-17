import 'package:flutter/material.dart';

class ThemedScaffold extends StatelessWidget {
  final List<Widget> slivers;
  final Color color;
  ThemedScaffold(this.slivers, {this.color});

  @override
  Widget build(BuildContext context) {
    if (color != null)
      return Scaffold(
        backgroundColor: color,
        body: CustomScrollView(
          slivers: slivers,
        ),
      );
    else
      return Scaffold(
        body: CustomScrollView(
          slivers: slivers,
        ),
      );
  }
}
