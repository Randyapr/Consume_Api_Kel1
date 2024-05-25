import 'package:consume_api/base_Url.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class AddUserPage extends StatefulWidget {
  const AddUserPage({Key? key}) : super(key: key);

  @override
  State<AddUserPage> createState() => _AddUserPageState();
}

class _AddUserPageState extends State<AddUserPage> {
  TextEditingController namaController = TextEditingController();
  TextEditingController jobController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add User"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          child: Column(
            children: [
               TextFormField(
                controller: namaController,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  hintText: "Masukkan Nama",
                ),
              ),
              TextFormField(
                controller: jobController,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  hintText: "Masukkan Job",
                ),
              ),
              
              SizedBox(height: 20),
              FilledButton(
                onPressed: () async{
                  Uri url = Uri.parse("$baseUrl/users");

                  final data = {
                    "nama" : namaController.text,
                    "job": jobController.text,
                  };

                  final response = await http.post(url, body: jsonEncode(data));

                  if (response.statusCode == 201){
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        backgroundColor: Colors.grey,
                        content: Text("User berhasil di tambahkan"),
                      ),
                    );
                  } else{
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        backgroundColor: Colors.red,
                        content: Text("user gagal ditambahkan"),
                      ),
                    );
                  }
                }, 
                child: Text ("Add User")),
            ],
          ),
        ),
      ),
    );
  }
}
