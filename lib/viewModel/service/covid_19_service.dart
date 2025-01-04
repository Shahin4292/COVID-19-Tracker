import 'dart:convert';

import 'package:covid_19/res/app_url/app_url.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../model/covid_model.dart';

class Covid19Service extends GetxController {
  // List<CovidCountriesModel> countriesList = [];

  TextEditingController searchController = TextEditingController();

  Future<CovidModel?> getCovidApi() async {
    final response = await http.get(Uri.parse(AppUrl.covid19Api));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      return CovidModel.fromJson(data);
    } else {
      throw Exception('error');
    }
  }

  Future<dynamic> getCovidCountriesApi() async {
    var data;
    final response = await http.get(Uri.parse(AppUrl.countriesApi));
    print(response.statusCode.toString());
    print(data);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body.toString());
      return data;
      // for (int i = 0; i < data.length; i++) {
      //   data.add(CovidCountriesModel.fromJson(dataJson[i]));
      // }
    } else {
      throw Exception('error');
    }
    return null;
  }
}
