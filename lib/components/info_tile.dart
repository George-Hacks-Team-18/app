import 'package:app/components/themed_text.dart';
import 'package:app/globals/app_theme.dart';
import 'package:flutter/material.dart';

class InfoTile extends StatelessWidget {
  final String info, label;
  final Color color;
  InfoTile(this.info, this.label, {this.color = AppTheme.secondaryText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ThemedText(
            label,
            color: color,
          ),
          ThemedText(info),
        ],
      ),
    );
  }
}
