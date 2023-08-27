import 'dart:convert';

import 'package:electronic_queue/domain/models/services_corporatr_model.dart';
import 'package:http/http.dart' as http;

class IndividualResponce {
  IndividualResponce({required this.coporateValues, required this.statusCode});
  final IndividualResponce coporateValues;
  final int statusCode;
}

class ServicesIndividual {
  final String individualUrl = "https://34.28.165.38/ru";

  Future<List<CorporateModel>> getAllIndividual() async {
    final response = await http.get(
        Uri.parse('$individualUrl/service/services_individual/'),
        headers: {
          "Access-Control-Allow-Origin": "*",
          'Content-Type': 'application/json',
          'Accept': '*/*'
        });

    if (response.statusCode == 200 || response.statusCode == 201) {
      final List serviceIndividual =
          jsonDecode(utf8.decode(response.bodyBytes));
      return serviceIndividual.map((e) => CorporateModel.fromJson(e)).toList();
    } else {
      throw Exception("Server failre");
    }
  }
}
