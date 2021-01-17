import 'package:app/components/themed_text.dart';
import 'package:app/globals/app_theme.dart';
import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  final String text;
  final bool showBack;
  final Color color;

  Header(
    this.text, {
    this.showBack = false,
    this.color = AppTheme.primary,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      collapsedHeight: 80,
      expandedHeight: 128,
      automaticallyImplyLeading: false,
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: EdgeInsets.symmetric(vertical: 16, horizontal: 8),
        title: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                showBack
                    ? SizedBox(
                        width: 32,
                        child: IconButton(
                          iconSize: 26,
                          padding: EdgeInsets.zero,
                          icon: Icon(
                            Icons.chevron_left,
                            color: color,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      )
                    : Container(),
                ThemedText(
                  text,
                  type: Type.header,
                  color: color,
                ),
              ],
            ),
          ],
        ),
      ),
      backgroundColor: Color(0x00),
    );
  }
}
