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

class EditInfoTile extends StatelessWidget {
  final String label;
  final Color color;
  final TextEditingController controller;
  EditInfoTile(this.label,
      {this.color = AppTheme.secondaryText, @required this.controller});

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
          SizedBox(
            width: MediaQuery.of(context).size.width - 200,
            height: 16,
            child: TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
              ),
              textAlign: TextAlign.end,
              style: themedTextStyle(Type.body),
              controller: controller,
            ),
          ),
        ],
      ),
    );
  }
}
