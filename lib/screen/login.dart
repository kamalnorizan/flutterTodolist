import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:todolist/models/loginmodel.dart';
import 'package:todolist/network_utils/connect.dart';
import 'package:todolist/widgets/mainDrawer.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController usernameEC = TextEditingController();
  TextEditingController passwordEC = TextEditingController();

  String? _validateUsername(String? value){
    if(value==''){
      return 'Sila masukkan Nama Pengguna';
    }
    return null;
  }

  String? _validatePassword(String? value){
    if(value==''){
      return 'Sila masukkan Kata Laluan';
    }else if(value=='invalid username or password'){
      return value;
    }
    return null;
  }

  void _submitForm() async{
    if(_formKey.currentState!.validate()){
      var email = usernameEC.text;
      var password = passwordEC.text;
      var data = {
        'email': email,
        'password': password
      };
      String apiUrl = 'authaccount/login';
      var res = await Network().authaccount(data, apiUrl);
      var body = LoginModel.fromJson(jsonDecode(res.body));
      if(body.code==0){
        Navigator.pushReplacementNamed(context, '/home');
      }else{
        _showAlertDialog(context, 'Ralat', body.message);
        // setState(() {
        //   _validateUsername(body.message);
        //   _formKey.currentState!.validate();
        // });

      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Login'),
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),
        drawer: const MainDrawer(),
        body: SingleChildScrollView(
          child: Center(
            child: Container(
              padding: const EdgeInsets.all(25),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    const SizedBox(height: 100,),
                    Image.asset('assets/mains.png'),
                    const SizedBox(height: 20,),
                    TextFormField(
                        controller: usernameEC,
                        decoration: const InputDecoration(
                            labelText: 'Nama Pengguna'
                        ),
                      validator: _validateUsername,
                    ),
                    TextFormField(
                        controller: passwordEC,
                        obscureText: true,
                        decoration: const InputDecoration(
                            labelText: 'Kata Laluan'
                        ),
                      validator: _validatePassword,
                    ),
                    const SizedBox(height: 20,),
                    Row(
                      children: [
                        Expanded(
                            child: ElevatedButton(
                                onPressed: (){
                                  _submitForm();
                                },
                                child: const Text('Log Masuk'),
                            ),
                        ),
                        const SizedBox(width: 20,),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: (){},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                              foregroundColor: Colors.white,
                            ),
                            child: const Text('Daftar'),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
    );
  }

  void _showAlertDialog(BuildContext context, String title, String msg){
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              title: Text(title),
              content: Text(msg),
              actions: [
                TextButton(onPressed: (){
                  Navigator.of(context).pop();
                }, child: Text('Ok'))
              ]
          );
        }
    );
  }
}
