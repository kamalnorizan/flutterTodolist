import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todolist/screen/userDetail.dart';
import 'package:todolist/widgets/mainDrawer.dart';

import '../models/usersmodel.dart';
import '../network_utils/connect.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String? hello = 'Hello World';
  List<User> _users = [];
  int pageNumber = 1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getName();
    getUsers();
  }

  getName() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var name = localStorage.getString('name');

    setState(() {
      hello = 'Hai ' + name.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size;
    return Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),
        drawer: const MainDrawer(),
        body: Column(
          children: [
            SizedBox(
              height: MediaQuery.sizeOf(context).height * .2,
              child: Stack(
                children: [
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 15),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.inversePrimary,
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(40),
                        bottomRight: Radius.circular(40),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Hero(
                        tag: 'logo',
                        child: Image.asset(
                          'assets/mains.png',
                          width: MediaQuery.sizeOf(context).width * .5,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Text('Page Number: $pageNumber'),
                pageNumber > 1
                    ? InkWell(
                        onTap: () {
                          setState(() {
                            pageNumber--;
                            _users = [];
                            getUsers();
                          });
                        },
                        child: const Icon(Icons.arrow_circle_left))
                    : const SizedBox(),
                InkWell(
                    onTap: () {
                      setState(() {
                        pageNumber++;
                        _users = [];
                        getUsers();
                      });
                    },
                    child: const Icon(Icons.arrow_circle_right)),
              ],
            ),
            Expanded(
              child: _users.isEmpty
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : ListView.builder(
                      itemCount: _users.length,
                      itemBuilder: (BuildContext context, index) {
                        return ListTile(
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage(
                                _users[index].profilepicture.toString()),
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        UserDetail(_users[index])));
                          },
                          title: Text(_users[index].name.toString()),
                          subtitle: Text(_users[index].email.toString()),
                        );
                      },
                    ),
            ),
          ],
        ));
  }

  getUsers() async {
    var url = 'users?page=' + pageNumber.toString();
    var response = await Network().httpRequestWithHeader(url);

    UsersModel usersModel = UsersModel.fromJson(jsonDecode(response.body));
    setState(() {
      _users = usersModel.data!;
    });
    print(usersModel);
  }
}
