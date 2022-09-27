import 'dart:convert';
import 'dart:developer';
import 'package:flutterapp/view/const.dart';
import 'package:http/http.dart' as h;
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutterapp/view/func.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late String uid;
  // Future<void> signUp(String email, String password) async {
  //   var url = Uri.parse(
  //       'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyCkGLpX048IezhqGPwWTd_dbe4aG5P5X5g');
  //   var response = await h.post(url,
  //       body: json.encode({
  //         'email': email,
  //         'password': password,
  //       }));
  //   print(response.statusCode);
  // }

  Future<bool> singIn(String email, String password) async {
    var url = Uri.parse(
        'https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=AIzaSyCkGLpX048IezhqGPwWTd_dbe4aG5P5X5g');

    final response = await h.post(
      url,
      body: json.encode(
        {
          'email': email,
          'password': password,
          'returnSecureToken': true,
        },
      ),
    );

    // print(json.decode('${response.statusCode}'));
    // print(json.decode(response.body));
    Map<String, dynamic> temp = json.decode(response.body);
    // print(json.decode(response.body));
    // UId uidClass = UId(uid);

    if (temp['idToken'] != null) {
      uid = temp['localId'];
      // print(uid);
      // print(temp['idToken']);
      return true;
      // Navigator.of(context)
      //     .pushReplacementNamed('/GeneratedHomepageWidget', arguments: uid);
      // uidClass.fetchVal();
    } else {
      return false;
    }
  }

  final GlobalKey<FormState> _formKey = GlobalKey();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                // SizedBox(
                //   width: double.infinity,
                // ),
                Container(
                  height: 100,
                  margin: EdgeInsets.only(top: 14),
                  child: Image.asset(
                      'assets/images/f000e04399ed1afca251309bb51b2f44c6a078f2.png'),
                ),
                Container(
                  margin: EdgeInsets.only(top: 30),
                  height: 600,
                  decoration: BoxDecoration(
                    boxShadow: [
                      new BoxShadow(
                        color: Colors.black.withOpacity(0.25),
                        blurRadius: 20.0,
                        offset: Offset(0, -10),
                      ),
                    ],
                  ),
                  child: SizedBox(
                    height: double.infinity,
                    child: Card(
                      elevation: 6,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Column(
                        // crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                            child: Text(
                              'Log into your Account',
                              style: TextStyle(
                                height: 1.171875,
                                fontSize: 16.0,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w400,
                                color: Color.fromARGB(255, 92, 88, 88),

                                /* letterSpacing: 0.0, */
                              ),
                            ),
                          ),
                          Form(
                              key: _formKey,
                              autovalidateMode: AutovalidateMode.always,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Email Address'),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(),
                                          hintText: "Enter your email address"),
                                      controller: emailController,
                                    ),
                                  ),
                                  Text('Password'),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        hintText: "Enter Password",
                                      ),
                                      controller: passwordController,
                                      obscureText: true,
                                    ),
                                  ),
                                ],
                              )),
                          //Inner Form column End
                          TextButton(
                            style: TextButton.styleFrom(
                                backgroundColor: kButtinColor,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 150, vertical: 15)),
                            onPressed: () {
                              // print('${emailController.text}'
                              //     '${passwordController.text}');
                              // signUp('${emailController.text}',
                              //     '${passwordController.text}');

                              singIn('${emailController.text}',
                                      '${passwordController.text}')
                                  .then((val) {
                                if (val) {
                                  // setState(() {
                                  //   isLoading = false;
                                  // });

                                  if (emailController.text.contains('admin')) {
                                    Navigator.of(context).pushReplacementNamed(
                                      '/admin',
                                    );
                                  } else {
                                    Navigator.of(context).pushReplacementNamed(
                                        '/GeneratedHomepageWidget',
                                        arguments: uid);
                                  }
                                }
                              });
                            },
                            child: Text(
                              'Log in',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          Text(
                            'Don\'t have an account?',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          TextButton(
                            style: ButtonStyle(
                              padding: MaterialStateProperty.all(
                                  EdgeInsets.symmetric(
                                      horizontal: 125, vertical: 15)),
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    side: BorderSide(
                                        color: kButtinColor,
                                        width: 1,
                                        style: BorderStyle.solid),
                                    borderRadius: BorderRadius.circular(18)),
                              ),
                            ),
                            onPressed: () {
                              // setState(() {});
                              Navigator.pushNamed(
                                  context, '/GeneratedSignupPageWidget');
                            },
                            child: Text('Create an Account'),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
