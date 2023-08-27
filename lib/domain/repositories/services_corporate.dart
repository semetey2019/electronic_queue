import 'dart:convert';

import 'package:electronic_queue/domain/models/services_corporatr_model.dart';
import 'package:http/http.dart' as http;

class CorporateResponce {
  CorporateResponce({required this.coporateValues, required this.statusCode});
  final CorporateResponce coporateValues;
  final int statusCode;
}

class ServicesCorporate {
  final String corporateUrl = "https://34.28.165.38/ru";

  Future<List<CorporateModel>> getAllCorporate() async {
    final response = await http
        .get(Uri.parse('$corporateUrl/service/services_corporate/'), headers: {
      "Access-Control-Allow-Origin": "*",
      'Content-Type': 'application/json',
      'Accept': '*/*'
    });

    if (response.statusCode == 200 || response.statusCode == 201) {
      final List serviceCorporate = jsonDecode(utf8.decode(response.bodyBytes));
      print(response.body);
      return serviceCorporate.map((e) => CorporateModel.fromJson(e)).toList();
    } else {
      throw Exception("Server failre");
    }
  }
}

// ListView.builder(
//   itemCount: dataList.length,
//   itemBuilder: (context, index) {
//     return ListTile(
//       title: Text(dataList[index].name),
//       subtitle: Text(dataList[index].age.toString()),
//     );
//   },
// );


// List<MyData> dataList = [];

// for (var item in data) {
//   dataList.add(MyData.fromJson(item));
// }