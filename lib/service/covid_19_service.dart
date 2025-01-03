import 'dart:convert';

import 'package:covid_19/res/app_url/app_url.dart';
import 'package:http/http.dart' as http;

import '../model/covid_model.dart';

class Covid19Service {
  Future<CovidModel?> getCovidApi() async {
    final response = await http.get(Uri.parse(AppUrl.covid19Api));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      return CovidModel.fromJson(data);
    } else {
      throw Exception('error');
    }
  }
}
