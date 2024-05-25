import 'dart:convert';

import 'package:consume_api/User.dart';
import 'package:consume_api/base_Url.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'add_user_page.dart';
import 'user_detail_page.dart';

class ListUser extends StatefulWidget {
  const ListUser({super.key});

  @override
  State<ListUser> createState() => _ListUserState();
}

class _ListUserState extends State<ListUser> {
  List<User> listUser = [];

  void getAllUser() async {
    Uri url = Uri.parse("$baseUrl/users");

    final response = await http.get(url);

    final data = jsonDecode(response.body)['data'];
    setState(() {
      listUser = List<User>.from(data.map((user) => User(
            id: user['id'],
            firstName: user['first_name'],
            lastName: user['last_name'],
            email: user['email'],
            avatar: user['avatar'],
          )));
    });
  }

  @override
  void initState() {
    getAllUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List User Page"),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddUserPage()),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: listUser.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: Text(listUser[index].id.toString()),
              title: Text(
                  '${listUser[index].firstName} ${listUser[index].lastName}'),
              subtitle: Text(listUser[index].email),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => UserDetailPage(user: listUser[index]),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
