import 'dart:convert';

import 'package:flutter/material.dart';

import '../models/usersmodel.dart';

class EditUser extends StatefulWidget {
  User user;

  EditUser(this.user);

  @override
  State<EditUser> createState() => _EditUserState();
}

class _EditUserState extends State<EditUser> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController nameEC = TextEditingController();
  TextEditingController emailEC = TextEditingController();
  TextEditingController locationEC = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(jsonEncode(widget.user));
    nameEC.text = widget.user.name.toString();
    emailEC.text = widget.user.email.toString();
    locationEC.text = widget.user.location.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit User Profile'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.all(15),
          children: [
            TextFormField(
                controller: nameEC,
                decoration: InputDecoration(labelText: 'Name'),
                validator: (value) {
                  if (value== '') {
                    return 'This field is required';
                  }
                  return null;
                }),
            TextFormField(
                controller: emailEC,
                decoration: InputDecoration(labelText: 'Email'),
                validator: (value) {
                  if (value== '') {
                    return 'This field is required';
                  }

                  final emailRegex = RegExp(r'^[a-zA-Z0-9]+(?:\.[a-zA-Z0-9]+)*@[a-zA-Z0-9]+(?:\.[a-zA-Z0-9]+)*$');
                  if(!emailRegex.hasMatch(value.toString())){
                    return 'Please enter a valid email address';
                  }
                  return null;
                }),
            TextFormField(
                controller: locationEC,
                decoration: InputDecoration(labelText: 'Location'),
                validator: (value) {
                  if (value== '') {
                    return 'This field is required';
                  }
                  return null;
                }),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                _submitForm();
              },
              child: Text('Update'),
            )
          ],
        ),
      ),
    );
  }

  void _submitForm() {
    if(_formKey.currentState!.validate()){

    }
  }
}
