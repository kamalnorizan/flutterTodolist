import 'package:flutter/material.dart';
import 'package:todolist/widgets/mainDrawer.dart';

class Home extends StatelessWidget {
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
          child: const Text('Hello World'),
        ),
      ),
    );
  }
}
