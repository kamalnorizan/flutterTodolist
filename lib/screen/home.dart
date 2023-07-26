import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todolist/widgets/mainDrawer.dart';

import '../models/usersmodel.dart';
import '../network_utils/connect.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String? hello = 'Hello World';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getName();
    getUsers();
  }

  getName() async{
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var name = localStorage.getString('name');

    setState(() {
      hello = 'Hai ' + name.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      drawer: const MainDrawer(),
      body: Center(
        child: Container(
          child: Text(hello.toString()),
        ),
      ),
    );
  }

  getUsers() async{
    var url = 'users?page=1';
    var response = await Network().httpRequestWithHeader(url);
    // print(response.body);

    UsersModel usersModel = UsersModel.fromJson(jsonDecode(response.body));
    print(usersModel);
  }
}
