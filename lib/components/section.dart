import 'package:app/components/themed_text.dart';
import 'package:app/globals/app_theme.dart';
import 'package:flutter/material.dart';

class Section extends StatelessWidget {
  final List<Widget> children;
  final String title;
  final Color color;
  Section({this.children, this.color = AppTheme.primary, @required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        color: color,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 12, bottom: 8),
              child: ThemedText(
                title,
                type: Type.h2,
              ),
            ),
            children != null ? Divider() : Container(),
            children != null ? Column(children: children) : Container(),
          ],
        ),
      ),
    );
  }
}
