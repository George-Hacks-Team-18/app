import 'package:app/components/button.dart';
import 'package:app/components/header.dart';
import 'package:app/components/themed_scaffold.dart';
import 'package:app/components/themed_text_field.dart';
import 'package:app/globals/app_theme.dart';
import 'package:app/pages/patient/sign_up_page.dart';
import 'package:flutter/material.dart';

import '../doctor_home_page.dart';
import 'login_function.dart';

class DoctorLoginPage extends StatefulWidget {
  @override
  _DoctorLoginPageState createState() => _DoctorLoginPageState();
}

class _DoctorLoginPageState extends State<DoctorLoginPage> {
  String username, password;

  @override
  Widget build(BuildContext context) {
    return ThemedScaffold(
      [
        Header(
          'Medical Login',
          color: AppTheme.scaffoldColor,
          showBack: true,
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(32), topRight: Radius.circular(32)),
              child: Container(
                height: MediaQuery.of(context).size.height,
                color: AppTheme.scaffoldColor,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 32),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          'assets/vaxifiedicon.png',
                          height: 142,
                        ),
                      ),
                    ),
                    ThemedTextField(
                      text: 'Username',
                      onChanged: (v) => username = v,
                    ),
                    ThemedTextField(
                      text: 'Password',
                      onChanged: (v) => password = v,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            child: Text('Forgot Password'),
                            onPressed: () {},
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: double.infinity,
                        child: Button(
                          'Log In',
                          onPressed: () async {
                            bool canLogin =
                                await login(username, password ?? '', context);
                            canLogin
                                ? Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => DoctorHomePage()))
                                : print('no');
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        )
      ],
      color: AppTheme.primary,
    );
  }
}
