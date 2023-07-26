import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Network{
  final String _url = 'http://restapi.adequateshop.com/api/';

  String? token;

  authaccount(data, apiUrl) async{
    var fullUrl = _url + apiUrl;
    return await http.post(Uri.parse(fullUrl), body: jsonEncode(data), headers: {'Content-type': 'application/json', 'Accept': 'application/json'});
  }

  httpRequestWithHeader(apiUrl) async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var token = localStorage.getString('token');
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer '+ token.toString()
    };
    var fullUrl = _url + apiUrl;
    return await http.get(Uri.parse(fullUrl), headers: headers);
  }
}