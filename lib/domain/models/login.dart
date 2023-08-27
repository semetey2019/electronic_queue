// class LoginModel22 {
//   String? refresh;
//   String? access;
//   User? user;

//   LoginModel22({this.refresh, this.access, this.user});

//   LoginModel22.fromJson(Map<String, dynamic> json) {
//     refresh = json['refresh'];
//     access = json['access'];
//     user = json['user'] != null ? new User.fromJson(json['user']) : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['refresh'] = refresh;
//     data['access'] = access;
//     if (user != null) {
//       data['user'] = user!.toJson();
//     }
//     return data;
//   }
// }

import 'dart:convert';
import 'package:electronic_queue/presentation/widgets/custom_bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class UserProfille {
  String? refresh;
  String? access;
  User? user;

  UserProfille({this.refresh, this.access, this.user});

  UserProfille.fromJson(Map<String, dynamic> json) {
    refresh = json['refresh'];
    access = json['access'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['refresh'] = refresh;
    data['access'] = access;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
  }

  login(String text, String text2, BuildContext context) {}
}

class User {
  String? email;
  String? firstName;
  String? lastName;
  String? position;
  String? accessLevel;
  String? windowNumber;

  User(
      {this.email,
      this.firstName,
      this.lastName,
      this.position,
      this.accessLevel,
      this.windowNumber});

  User.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    position = json['position'];
    accessLevel = json['access_level'];
    windowNumber = json['window_number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['position'] = position;
    data['access_level'] = accessLevel;
    data['window_number'] = windowNumber;
    return data;
  }

  Future<void> login(
      String email, String password, BuildContext context) async {
    try {
      Response response = await post(
          Uri.parse('https://34.28.165.38/ru/client/login/'),
          body: {'email': email, 'password': password});
      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = jsonDecode(response.body.toString());
        print(data['user']);
        print('logg ss');
        UserProfille aaa;
        aaa = UserProfille.fromJson(data);
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CustomBottomBar(
                      userProfile3: aaa,
                    )));
      } else {
        print('filed');
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
