import 'dart:convert';
import 'package:electronic_queue/domain/models/services_all_model.dart';
import 'package:http/http.dart' as http;

class ServiceAllResponce {
  ServiceAllResponce(
      {required this.serviceallValues, required this.statusCode});
  final ServiceAllResponce serviceallValues;
  final int statusCode;
}

class ServiceChoose {
  final String chooseUrl = "https://34.28.165.38/ru";
  Future<List<ServicesAllModel>> getAllServices() async {
    final response =
        await http.get(Uri.parse('$chooseUrl/service/services_all/'), headers: {
      "Access-Control-Allow-Origin": "*",
      'Content-Type': 'application/json',
      'Accept': '*/*'
    });

    if (response.statusCode == 200 || response.statusCode == 201) {
      print(response.body);
      final List serviceAll = jsonDecode(utf8.decode(response.bodyBytes));
      return serviceAll.map((e) => ServicesAllModel.fromJson(e)).toList();
    } else {
      throw Exception("Server failre");
    }
  }
}
