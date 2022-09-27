import 'package:flutter/material.dart';
import 'package:flutterapp/cse_202100app/generatedverificationcodewidget2/generated/GeneratedGroup1Widget2.dart';
import 'package:flutterapp/cse_202100app/generatedverificationcodewidget2/generated/GeneratedVerifiedWidget.dart';
import 'package:flutterapp/cse_202100app/generatedverificationcodewidget2/generated/GeneratedGroup30Widget.dart';
import 'package:flutterapp/cse_202100app/generatedverificationcodewidget2/generated/GeneratedIcrounddoneWidget4.dart';
import 'package:flutterapp/cse_202100app/generatedverificationcodewidget2/generated/GeneratedEllipse1Widget2.dart';

/* Frame Verification Code
    Autogenerated by FlutLab FTF Generator
  */
class GeneratedVerificationCodeWidget2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
        child: ClipRRect(
      borderRadius: BorderRadius.zero,
      child: Container(
        width: 360.0,
        height: 276.0,
        child: Stack(
            clipBehavior: Clip.none,
            fit: StackFit.expand,
            alignment: Alignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.zero,
                child: Container(
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
              ),
              Positioned(
                left: 144.0,
                top: 129.0,
                right: null,
                bottom: null,
                width: 78.0,
                height: 24.0,
                child: GeneratedVerifiedWidget(),
              ),
              Positioned(
                left: 76.0,
                top: 192.0,
                right: null,
                bottom: null,
                width: 209.0,
                height: 42.0,
                child: GeneratedGroup30Widget(),
              ),
              Positioned(
                left: 315.0,
                top: 11.0,
                right: null,
                bottom: null,
                width: 32.0,
                height: 32.0,
                child: GeneratedEllipse1Widget2(),
              ),
              Positioned(
                left: 326.5862121582031,
                top: 22.586181640625,
                right: null,
                bottom: null,
                width: 8.567963600158691,
                height: 8.82758617401123,
                child: GeneratedGroup1Widget2(),
              ),
              Positioned(
                left: 149.0,
                top: 61.0,
                right: null,
                bottom: null,
                width: 62.0,
                height: 62.0,
                child: GeneratedIcrounddoneWidget4(),
              )
            ]),
      ),
    ));
  }
}
