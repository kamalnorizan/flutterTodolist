import 'package:flutter/material.dart';

import '../widgets/mainDrawer.dart';

class MyFirstScreen extends StatefulWidget {
  @override
  State<MyFirstScreen> createState() => _MyFirstScreenState();
}

class _MyFirstScreenState extends State<MyFirstScreen> {
  TextEditingController _pendapatanEC = TextEditingController();
  TextEditingController _nisabEC = TextEditingController();
  String? hasil = '';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _nisabEC.text = '21244.81';
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.blue,
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text('Kalkulator Zakat Pendapatan'),
        ),
      drawer: MainDrawer(),
        body: Container(
          width: double.infinity,
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Pendapatan Kasar'),
              TextField(
                controller: _pendapatanEC,
                  decoration: const InputDecoration(
                    labelText: 'Pendapatan dari semua sumber(setahun)'
                  )
              ),
              TextField(
                  controller: _nisabEC,
                  decoration: InputDecoration(
                      labelText: 'Nisab Semasa'
                  )
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(child: ElevatedButton(onPressed: (){
                  print(_pendapatanEC.text);
                  if(_pendapatanEC.text != ''){
                    double pendapatan = double.parse(_pendapatanEC.text);
                    double nisab = double.parse(_nisabEC.text);
                    setState(() {
                      if(pendapatan >= nisab){
                        hasil = 'Jumlah Zakat: ' + (pendapatan * 0.025).toString();
                      }else{
                        hasil = 'Anda tidak dikenakan Zakat Pendapatan';
                      }
                      _showAlertDialog(context, 'Makluman',hasil.toString());
                    });
                  }else{
                    setState(() {
                      hasil='';
                    });
                    _showAlertDialog(context, 'Ralat','Sila isi ruangan pendapatan');
                  }
                }, child: Text('KIRA ZAKAT'),)),
              ),
              hasil != '' ? Text(hasil.toString(), style: TextStyle(color: Colors.red),) : const SizedBox()
            ],
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

