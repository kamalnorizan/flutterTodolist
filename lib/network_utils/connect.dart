import 'dart:convert';

import 'package:http/http.dart' as http;

class Network{
  final String _url = 'http://restapi.adequateshop.com/api/';

  String? token;

  authaccount(data, apiUrl) async{
    var fullUrl = _url + apiUrl;
    return await http.post(Uri.parse(fullUrl), body: jsonEncode(data), headers: {'Content-type': 'application/json', 'Accept': 'application/json'});
  }
}