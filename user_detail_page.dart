import 'package:consume_api/User.dart';
import 'package:flutter/material.dart';

class UserDetailPage extends StatelessWidget {
  final User user;

  const UserDetailPage({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User Detail Page"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.network(
              user.avatar,
              width: 160, 
              height: 160,
              ),
            // CircleAvatar(
            //   foregroundImage: NetworkImage(user.avatar),
            //   radius: 80,
            // ),
            SizedBox(height: 16),
            Text(
              '${user.firstName} ${user.lastName}',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 8),
            Text(
              user.email,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
