import 'dart:convert';

import 'package:bhagvadgita_api/screen/home_screen/model/home_model.dart';
import 'package:bhagvadgita_api/screen/slok_screen/slok_model/slok_model.dart';
import 'package:http/http.dart' as http;

class ApiHelper {
  static final helper = ApiHelper._();

  ApiHelper._();

  Future<List<HomeModel>> callApi() async {
    Uri link = Uri.parse("https://bhagavad-gita3.p.rapidapi.com/v2/chapters/");
    var respone = await http.get(link, headers: {
      'X-RapidAPI-Key': '0879344c6dmsha1627f90fd35f77p1ad740jsne6f395c3cb33',
      'X-RapidAPI-Host': 'bhagavad-gita3.p.rapidapi.com'
    });
    List json = jsonDecode(respone.body);
    List<HomeModel> bhagvat = json.map((e) => HomeModel.fromJson(e)).toList();
    return bhagvat;
  }

 // ---------- SlokModel ----------//

  Future<List<SlokModel>> getlApi(int ch) async {
    Uri link = Uri.parse("https://bhagavad-gita3.p.rapidapi.com/v2/chapters/$ch/verses/");
    var respone = await http.get(link, headers: {
      'X-RapidAPI-Key': '0879344c6dmsha1627f90fd35f77p1ad740jsne6f395c3cb33',
      'X-RapidAPI-Host': 'bhagavad-gita3.p.rapidapi.com'
    });
    List json = jsonDecode(utf8.decode(respone.bodyBytes));
    List<SlokModel> apiSlok = json.map((e) => SlokModel.fromJson(e)).toList();
    return apiSlok;
  }
}
