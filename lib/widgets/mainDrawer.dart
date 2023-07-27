import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainDrawer extends StatefulWidget {
  const MainDrawer({
    super.key,
  });

  @override
  State<MainDrawer> createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  String? token;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkLoggedIn();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            child: Column(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage(
                    'assets/default_user.jpg',
                  ),
                ),
                Text(
                  'Pengguna 1',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                )
              ],
            ),
            decoration: BoxDecoration(color: Colors.blueGrey),
          ),
          token == null
              ? ListTile(
                  leading: const Icon(Icons.key),
                  title: const Text(
                    'Log Masuk',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushReplacementNamed(context, '/');
                  },
                )
              : ListTile(
                  leading: const Icon(Icons.dashboard),
                  title: const Text(
                    'Utama',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushReplacementNamed(context, '/');
                  },
                ),
          ListTile(
            leading: const Icon(Icons.bar_chart),
            title: const Text(
              'Charts',
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushReplacementNamed(context, '/charts');
            },
          ),
          ListTile(
            leading: const Icon(Icons.animation),
            title: const Text(
              'Animation',
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushReplacementNamed(context, '/animation');
            },
          ),
          ListTile(
            leading: const Icon(Icons.map),
            title: const Text(
              'Maps',
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushReplacementNamed(context, '/gmap');
            },
          ),
          ListTile(
            leading: const Icon(Icons.calculate),
            title: const Text('Kalkulator'),
            subtitle: const Text('Zakat Pendapatan'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushReplacementNamed(context, '/kalkulator');
            },
          ),
          ListTile(
            leading: const Icon(Icons.calculate),
            title: const Text('Log Keluar'),
            onTap: () async {
              SharedPreferences localStorage =
                  await SharedPreferences.getInstance();
              // localStorage.clear();
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

  void checkLoggedIn() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    setState(() {
      token = localStorage.getString('token');
    });
  }
}
