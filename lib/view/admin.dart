import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutterapp/view/const.dart';
import 'package:http/http.dart' as http;

class Admin extends StatefulWidget {
  const Admin({Key? key}) : super(key: key);

  @override
  State<Admin> createState() => _AdminState();
}

class _AdminState extends State<Admin> {
  var loading = false;
  List<String> parent_no = [];
  List<String> std_name = [];
  List<String> roll = [];
  List<bool> sent = [];
  void didChangeDependencies() async {
    setState(() {
      loading = true;
    });
    var url = Uri.parse(
        'https://course-reg-77b03-default-rtdb.firebaseio.com/user_data.json');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var data = json.decode(response.body) as Map<String, dynamic>;
      data.forEach((key, value) {
        // print(value['parent_no']);

        parent_no.add(value['parent_no'].toString());
        std_name.add(value['name'].toString());
        roll.add(value['roll'].toString());
        sent.add(false);
      });
      print('done');
      setState(() {
        loading = false;
      });
    }
    // print(parent_no[1]);
    super.didChangeDependencies();
  }

  // getParentNumber() async {
  //   var url = Uri.parse(
  //       'https://course-reg-77b03-default-rtdb.firebaseio.com/user_data.json');
  //   var response = await http.get(url);
  //   if (response.statusCode == 200) {
  //     print(json.decode(response.body));
  //   }
  // }
  Future<void> sendIndividual(
      String number, String name, BuildContext context) async {
    var msgText =
        "Dear Gaurdian Your Son/Daugher $name Got 18 Marks in The CSE 2101 CT-2";
    var url = Uri.parse(
        'http://0.0.0.0:8090/SendSMS?username=cse&password=1234&phone=880$number&message=$msgText');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Message Sent to Parents of $name'),
          elevation: 20,
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.only(),
        ),
      );
    }
  }

  Future<void> sendSms(BuildContext context) async {
    var i = 0;
    parent_no.forEach((val) async {
      var msgText =
          "Dear Gaurdian Your Son/Daugher ${std_name[i]} Got 18 Marks in The CSE 2101 CT-2";

      var url = Uri.parse(
          'http://0.0.0.0:8090/SendSMS?username=cse&password=1234&phone=880$val&message=$msgText');
      i++;

      var response = await http.get(url);
      print(response.statusCode);
      print(json.decode(response.body));
      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text('Message Sent Successfully to All Guardians'),
            elevation: 20,
            behavior: SnackBarBehavior.floating,
            margin: EdgeInsets.only(),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    print(sent);
    // final args = ModalRoute.of(context)!.settings.arguments as String;
    String Ptext = "Send";
    String AText = "Sent";
    Color Pcol = Colors.white;
    Color ACol = Colors.grey;
    var color = Color(0xffEEBF41);
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Page'),
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pushReplacementNamed('/');
            },
            icon: Icon(Icons.logout)),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: double.infinity,
          ),
          Container(
            height: 30,
            margin: EdgeInsets.only(
              top: 30,
              bottom: 20,
            ),
            child: const Text(
              'List of Students',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
            ),
          ),
          loading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Container(
                  height: MediaQuery.of(context).size.height * 0.6,
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                  margin: EdgeInsets.symmetric(horizontal: 7),
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    border: Border.all(color: Colors.black),
                  ),
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              'Roll',
                              style: topStyle,
                            ),
                            Text('Name', style: topStyle),
                            Text(' Contact', style: topStyle),
                            Text('Status', style: topStyle),
                          ],
                        ),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.5,
                        child: ListView.builder(
                          // shrinkWrap: true,

                          itemCount: parent_no.length,
                          itemBuilder: (context, index) {
                            var send = sent[index];
                            return Container(
                              margin: EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 5),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: color,
                                  shape: BoxShape.rectangle,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(18.0)),
                                ),
                                child: ListTile(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                      18.0, // Change your border radius here
                                    ),
                                  ),
                                  // tileColor: color,
                                  leading: Text(roll[index]),
                                  title: Row(
                                    children: [
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.48,
                                        child: Row(
                                          children: [
                                            SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.22,
                                                child: Text(std_name[index])),
                                            Text("0" + parent_no[index]),
                                          ],
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          TextButton(
                                              onPressed: () {
                                                setState(() {
                                                  sent[index] = true;
                                                });
                                                sendIndividual(parent_no[index],
                                                    std_name[index], context);
                                              },
                                              child: Text(
                                                send ? AText : Ptext,
                                                style: TextStyle(
                                                  color: send ? ACol : Pcol,
                                                ),
                                              )),
                                        ],
                                      )
                                    ],
                                  ),
                                  // trailing: TextButton(
                                  //     onPressed: () {
                                  //       setState(() {
                                  //         sent[index] = true;
                                  //       });
                                  //       sendIndividual(parent_no[index],
                                  //           std_name[index], context);
                                  //     },
                                  //     child: Text(
                                  //       send ? AText : Ptext,
                                  //       style: TextStyle(
                                  //         color: send ? ACol : Pcol,
                                  //       ),
                                  //     )),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
          TextButton(
            onPressed: () => sendSms(context),
            child: Text('Send Message to All Parents'),
          )
        ],
      ),
    );
  }
}
