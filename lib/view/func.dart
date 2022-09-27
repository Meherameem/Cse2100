import 'dart:convert';
import 'dart:ffi';

import 'package:flutterapp/view/user_data.dart';
import 'package:http/http.dart' as h;

class UId {
  final String uid;

  UId(this.uid);
  String getUid() {
    return uid;
  }

  Future<UserData> fetchVal() async {
    // print(uid);
    String? name;
    String? roll;
    String? parent;
    var url = Uri.parse(
        'https://course-reg-77b03-default-rtdb.firebaseio.com/user_data/$uid.json');
    var response = await h.get(url);
    var mapedUData = json.decode(response.body);
    print(mapedUData['parent_no']);
    return UserData(
      name: mapedUData['name'].toString(),
      roll: mapedUData['roll'].toString(),
      parent: mapedUData['parent_no'].toString(),
    );
  }
}



// import 'dart:convert';

// import 'package:http/http.dart' as h;

// Future<void> singIn(String email, String password) async {
//   var url = Uri.parse(
//       'https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=AIzaSyCkGLpX048IezhqGPwWTd_dbe4aG5P5X5g');

//   final response = await h.post(
//     url,
//     body: json.encode(
//       {
//         'email': email,
//         'password': password,
//         'returnSecureToken': true,
//       },
//     ),
//   );

//   // print(json.decode('${response.statusCode}'));
//   // print(json.decode(response.body));
//   Map<String, dynamic> temp = json.decode(response.body);
//   print(temp['localId']);
// }

// Future<void> signUp(String email, String password) async {
//   var url = Uri.parse(
//       'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyCkGLpX048IezhqGPwWTd_dbe4aG5P5X5g');
//   var response = await h.post(
//     url,
//     body: json.encode(
//         {'email': email, 'password': password, 'returnSecureToken': true}),
//   );
//   // print(json.decode(response.statusCode.toString()));
//   print(response.body);
// }
