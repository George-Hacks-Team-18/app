import 'package:app/globals/app_theme.dart';
import 'package:flutter/material.dart';

class ThemedScaffold extends StatelessWidget {
  final List<Widget> slivers;
  final Color color;
  ThemedScaffold(this.slivers, {this.color = AppTheme.scaffoldColor});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color,
      body: CustomScrollView(
        slivers: slivers,
      ),
    );
  }
}
