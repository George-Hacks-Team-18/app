import 'package:app/globals/app_theme.dart';
import 'package:flutter/material.dart';

class ThemedTextField extends StatelessWidget {
  final String text;
  final Function onChanged;
  ThemedTextField({@required this.text, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Container(
          color: AppTheme.lightGray,
          child: TextField(
            decoration: InputDecoration(
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              contentPadding:
                  EdgeInsets.only(left: 25, bottom: 11, top: 11, right: 15),
              hintText: text,
            ),
          ),
        ),
      ),
    );
  }
}
