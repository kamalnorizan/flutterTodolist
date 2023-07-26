import 'package:flutter/material.dart';


class UserDetail extends StatefulWidget {
  @override
  State<UserDetail> createState() => _UserDetailState();
}

class _UserDetailState extends State<UserDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('User Detail'),
        ),
        body: Center(
          child: Container(
            child: Text('Hello World'),
          ),
        ),
    );
  }
}
