// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:developer';

import 'package:electronic_queue/domain/models/login.dart';
import 'package:electronic_queue/presentation/widgets/custom_bottom_nav_bar.dart';
import 'package:electronic_queue/utils/constants/constants.dart';
import 'package:electronic_queue/utils/extensions/remote_client.dart';
import 'package:flutter/material.dart';

class RegisterService {
  const RegisterService({required this.remoteClient});

  final RemoteClient remoteClient;

  Future<void> registerAuth(BuildContext context,
      {required UserModel userModel}) async {
    final response = await remoteClient.post(
      ApiConst.registerApi,
      body: userModel.toMap(),
    );
    log(response!.body);
    final body = response.body;
    log(body);
    //final data = jsonDecode(body.toString());
    if (body.isNotEmpty) {
      // ignore: use_build_context_synchronously
      UserProfille aa = UserProfille(
          //   email: userModel.email,
          //   firstName: userModel.firstName,
          //   lastName: userModel.lastName,
          user: User(
              email: userModel.email,
              firstName: userModel.firstName,
              lastName: userModel.lastName));
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => CustomBottomBar(
            userProfile3: aa,
          ),
        ),
      );
    }
  }
}

class UserModel {
  const UserModel({
    required this.lastName,
    required this.firstName,
    required this.email,
    this.password,
    this.passwordConfirm,
  });

  final String lastName;
  final String firstName;
  final String email;
  final String? password;
  final String? passwordConfirm;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'last_name': lastName,
      'first_name': firstName,
      'email': email,
      'password': password,
      'password_confirm': passwordConfirm,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      lastName: map['lastName'] as String,
      firstName: map['firstName'] as String,
      email: map['email'] as String,
      password: map['password'] as String,
      passwordConfirm: map['passwordConfirm'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
