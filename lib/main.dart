import 'package:flutter/material.dart';
import 'package:flutterapp/cse_202100app/generatedloginpagewidget/GeneratedLoginPageWidget.dart';
import 'package:flutterapp/cse_202100app/generatedloginpagewidget1/GeneratedLoginPageWidget1.dart';
import 'package:flutterapp/cse_202100app/generatedsignuppagewidget/GeneratedSignupPageWidget.dart';
import 'package:flutterapp/cse_202100app/generatedsignuppagewidget1/GeneratedSignupPageWidget1.dart';
import 'package:flutterapp/cse_202100app/generatedhomepagewidget/GeneratedHomepageWidget.dart';
import 'package:flutterapp/cse_202100app/generatedhomepage2widget/GeneratedHomepage2Widget.dart';
import 'package:flutterapp/cse_202100app/generatedcourseregistrationformwidget/GeneratedCourseRegistrationFormWidget.dart';
import 'package:flutterapp/cse_202100app/generatedcourseregistrationform01widget/GeneratedCourseRegistrationForm01Widget.dart';
import 'package:flutterapp/cse_202100app/generatedverificationcodewidget/GeneratedVerificationCodeWidget.dart';
import 'package:flutterapp/cse_202100app/generatedverificationcodewidget1/GeneratedVerificationCodeWidget1.dart';
import 'package:flutterapp/cse_202100app/generatedverificationcodewidget2/GeneratedVerificationCodeWidget2.dart';
import 'package:flutterapp/view/admin.dart';
import 'package:flutterapp/view/login_page.dart';

void main() {
  runApp(CSE_202100App());
}

class CSE_202100App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // initialRoute: '/GeneratedLoginPageWidget',
      routes: {
        '/': (context) => LoginPage(),
        '/GeneratedLoginPageWidget': (context) => GeneratedLoginPageWidget(),
        '/admin': (context) => Admin(),
        '/GeneratedLoginPageWidget1': (context) => GeneratedLoginPageWidget1(),
        //signUp Page
        '/GeneratedSignupPageWidget': (context) => GeneratedSignupPageWidget(),
        '/GeneratedSignupPageWidget1': (context) =>
            GeneratedSignupPageWidget1(),
        //Home Page Widget
        '/GeneratedHomepageWidget': (context) => GeneratedHomepageWidget(),
        '/GeneratedHomepage2Widget': (context) => GeneratedHomepage2Widget(),
        '/GeneratedCourseRegistrationFormWidget': (context) =>
            GeneratedCourseRegistrationFormWidget(),
        '/GeneratedCourseRegistrationForm01Widget': (context) =>
            GeneratedCourseRegistrationForm01Widget(),
        '/GeneratedVerificationCodeWidget': (context) =>
            GeneratedVerificationCodeWidget(),
        '/GeneratedVerificationCodeWidget1': (context) =>
            GeneratedVerificationCodeWidget1(),
        '/GeneratedVerificationCodeWidget2': (context) =>
            GeneratedVerificationCodeWidget2(),
      },
    );
  }
}
