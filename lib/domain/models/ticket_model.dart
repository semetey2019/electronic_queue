import 'dart:convert';

import 'package:electronic_queue/domain/models/branch_mdeol.dart';
import 'package:electronic_queue/domain/models/login.dart';
import 'package:electronic_queue/domain/models/services_corporatr_model.dart';
import 'package:electronic_queue/presentation/widgets/custom_bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class TicketModel {
  String? branchId;
  int? queueId;
  ReservedTicket? reservedTicket;

  TicketModel({this.branchId, this.queueId, this.reservedTicket});

  TicketModel.fromJson(Map<String, dynamic> json) {
    branchId = json['branch_id'];
    queueId = json['queue_id'];
    reservedTicket = json['reserved_ticket'] != null
        ? ReservedTicket.fromJson(json['reserved_ticket'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['branch_id'] = branchId;
    data['queue_id'] = queueId;
    if (reservedTicket != null) {
      data['reserved_ticket'] = reservedTicket!.toJson();
    }
    return data;
  }
}

class ReservedTicket {
  int? id;
  String? serviceTime;
  UserProfille? client;
  CorporateModel? service;
  String? activationCode;
  String? createdAt;
  String? status;
  int? branch;
  int? queue;

  ReservedTicket(
      {this.id,
      this.serviceTime,
      this.client,
      this.service,
      this.activationCode,
      this.createdAt,
      this.status,
      this.branch,
      this.queue});

  ReservedTicket.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    serviceTime = json['service_time'];
    client =
        json['client'] != null ? UserProfille.fromJson(json['client']) : null;
    service = json['service'] != null
        ? CorporateModel.fromJson(json['service'])
        : null;
    activationCode = json['activation_code'];
    createdAt = json['created_at'];
    status = json['status'];
    branch = json['branch'];
    queue = json['queue'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['service_time'] = serviceTime;
    if (client != null) {
      data['client'] = client!.toJson();
    }
    if (service != null) {
      data['service'] = service!.toJson();
    }
    data['activation_code'] = activationCode;
    data['created_at'] = createdAt;
    data['status'] = status;
    data['branch'] = branch;
    data['queue'] = queue;
    return data;
  }

  Future<void> login(UserProfille user, BrancheModel brancheModel,
      CorporateModel uslugi, DateTime serviceTime, BuildContext context) async {
    final String serviceTimDatee =
        '${serviceTime.year}-${serviceTime.month}-${serviceTime.day}T${serviceTime.hour}:${serviceTime.minute}:${serviceTime.second}';
    final String tokenn = user.access.toString();
    try {
      Response response = await post(
        Uri.parse('https://34.28.165.38/ru/client/login/'),
        headers: {'Authorization': 'Bearer $tokenn'},
        body: {
          'branch_id': brancheModel.id,
          'service_time': serviceTimDatee,
          'service_id': uslugi.id
        },
      );
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
