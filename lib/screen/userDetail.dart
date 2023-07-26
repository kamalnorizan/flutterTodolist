import 'package:flutter/material.dart';

import '../models/usersmodel.dart';


class UserDetail extends StatefulWidget {
  final User user;

  UserDetail(this.user);
  @override
  State<UserDetail> createState() => _UserDetailState();
}

class _UserDetailState extends State<UserDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('User Detail'),
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),
        body: Column(
          children: [
            const SizedBox(height: 20,),
            Center(child: CircleAvatar( radius: 80, backgroundImage: NetworkImage(widget.user.profilepicture.toString()),),),
            const SizedBox(height: 20,),
            Center(
              child: Text(
                widget.user.name.toString(),
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30
                ),
              ),
            ),
            Center(
              child: Text(
                widget.user.email.toString(),
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20
                ),
              ),
            ),
            Center(
              child: Text(
                widget.user.location.toString(),
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(40,5,40,5),
                child: ElevatedButton(
                  onPressed: () {

                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.delete_forever_rounded),
                      SizedBox(width: 5,),
                      Text('Delete')
                    ],
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white
                  ),
                ),
              ),
            )
          ],
        ),
    );
  }
}
