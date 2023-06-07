import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyContactList(),
    );
  }
}

class MyContactList extends StatefulWidget {
  const MyContactList({super.key});

  @override
  State<MyContactList> createState() => _MyContactListState();
}

class _MyContactListState extends State<MyContactList> {
  String url = "https://randomuser.me/api/?results=30";
  List ? data;

  Future<String> makeRequest() async {
    var response = await http.get(Uri.parse(url),
    headers: {'Accept': 'aplication/json'});


    setState(() {
      var extractdata = json.decode(response.body);
      data = extractdata['results'];
    });

    print('Nombre: '+data?[0]['name']['first']);
    print('e-mail: ' + data?[0]['email']);

    print(response.body);

    return response.body;
  }
  @override
  void initState() {
    this.makeRequest();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Contact List ***"),
      ),
      body: ListView.builder(
        itemCount: data == null ? 0 : data!.length,
        itemBuilder: (BuildContext context, i){
          return ListTile(
            title: Text(data?[i]['name']['first']),
            subtitle: Text(data?[i]['phone']),
            leading: CircleAvatar(
              backgroundImage: NetworkImage(data?[i]['picture']['thumbnail']),
            ),
            trailing: Text(data?[i]['email']),
          );
        }
      )
    );
  }
}
