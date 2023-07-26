import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(child: Column(children: [CircleAvatar(radius: 50,backgroundImage: AssetImage('assets/default_user.jpg', ),), Text('Pengguna 1', style: TextStyle(fontSize: 18, color: Colors.white),)],), decoration: BoxDecoration(color: Colors.blueGrey),),
          IconButton(onPressed: (){}, icon: Icon(Icons.access_alarm)),
          TextButton(onPressed: (){}, child: Text('Test')),
          ListTile(
            leading: const Icon(Icons.key),
            title: const Text('Log Masuk', style: TextStyle(fontWeight: FontWeight.bold,fontStyle: FontStyle.italic),),
            onTap: (){
              Navigator.pop(context);
              Navigator.pushReplacementNamed(context, '/');
            },
          ),
          ListTile(
            leading: const Icon(Icons.calculate),
            title: const Text('Kalkulator'),
            subtitle: const Text('Zakat Pendapatan'),
            onTap: (){
              Navigator.pop(context);
              Navigator.pushReplacementNamed(context, '/kalkulator');
            },
          ),
          ListTile(
            leading: const Icon(Icons.calculate),
            title: const Text('Log Keluar'),
            onTap: () async{
              SharedPreferences localStorage = await SharedPreferences.getInstance();
              localStorage.remove('token');
              localStorage.remove('name');
              localStorage.remove('id');
              Navigator.pop(context);
              Navigator.pushReplacementNamed(context, '/login');
            },
          ),
        ],
      ),
    );
  }
}