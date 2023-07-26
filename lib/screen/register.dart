import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todolist/models/loginmodel.dart';
import 'package:todolist/network_utils/connect.dart';
import 'package:todolist/widgets/mainDrawer.dart';

class Register extends StatefulWidget {
  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController usernameEC = TextEditingController();
  TextEditingController passwordEC = TextEditingController();
  TextEditingController rePasswordEC = TextEditingController();
  TextEditingController emailEC = TextEditingController();

  String? _validateUsername(String? value){
    if(value==''){
      return 'Sila masukkan Nama Pengguna';
    }
    return null;
  }

  String? _validateEmail(String? value){
    if(value==''){
      return 'Sila masukkan Email';
    }
    return null;
  }

  String? _validatePassword(String? value){
    if(value==''){
      return 'Sila masukkan Kata Laluan';
    }
    return null;
  }

  String? _validateRePassword(String? value){
    if(value==''){
      return 'Sila masukkan Kata Laluan';
    }else if(value != passwordEC.text){
      return 'Maklumat tidak sama dengan kata laluan';
    }
    return null;
  }

  void _submitForm() async{
    if(_formKey.currentState!.validate()){
      var email = emailEC.text;
      var password = passwordEC.text;
      var name = usernameEC.text;
      var data = {
        'email': email,
        'password': password,
        'name': name
      };
      String apiUrl = 'authaccount/registration';
      var res = await Network().authaccount(data, apiUrl);
      // print(res.body);
      var body = LoginModel.fromJson(jsonDecode(res.body));
      if(body.code==0){
        SharedPreferences localStorage = await SharedPreferences.getInstance();
        localStorage.setString('token', body.data!.Token);
        localStorage.setString('name', body.data!.Name);
        localStorage.setInt('id', body.data!.Id);
        Navigator.pushReplacementNamed(context, '/home');
      }else{
        _showAlertDialog(context, 'Ralat', body.message);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
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
                  const SizedBox(height: 50,),
                  Image.asset('assets/mains.png'),
                  const SizedBox(height: 20,),
                  TextFormField(
                    controller: usernameEC,
                    decoration: const InputDecoration(
                        labelText: 'Nama'
                    ),
                    validator: _validateUsername,
                  ),
                  TextFormField(
                    controller: emailEC,
                    decoration: const InputDecoration(
                        labelText: 'Email'
                    ),
                    validator: _validateEmail,
                  ),
                  TextFormField(
                    controller: passwordEC,
                    obscureText: true,
                    decoration: const InputDecoration(
                        labelText: 'Kata Laluan'
                    ),
                    validator: _validatePassword,
                  ),
                  TextFormField(
                    controller: rePasswordEC,
                    obscureText: true,
                    decoration: const InputDecoration(
                        labelText: 'Re-Kata Laluan'
                    ),
                    validator: _validateRePassword,
                  ),
                  const SizedBox(height: 20,),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: (){
                            Navigator.pushReplacementNamed(context, '/login');
                          },
                          child: const Text('Mempunyai Akaun?'),
                        ),
                      ),
                      const SizedBox(width: 20,),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: (){
                            _submitForm();
                          },
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
