import 'package:dashboard/login.dart';
import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class Profil extends StatefulWidget {
  const Profil({super.key});

  @override
  State<Profil> createState() => _ProfilState();
}

class _ProfilState extends State<Profil> {
  late String? mytoken = '';

  getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    mytoken = prefs.getString('token');
    print('Token saved: $mytoken');
    setState(() {
      //refresh
    });
  }

  getData() async {
    var url = Uri.parse('https://myide.kerisik.com/sufia/t/api/todo/list');
    var response = await http.get(url, headers: {'X-API-KEY': '99cf5e94-68f7-429e-aaaf-a376837f905a'});
    //print('Response body: ${response.body}');

    //conver JSON jadi Local List array
    var jsonResponse = convert.jsonDecode(response.body);

    print('Json Response: $jsonResponse');
  }

  @override
  void initState() async {
    super.initState();
    getToken();
    await getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil'),
        actions: [
          IconButton(
              onPressed: () async {
                //utk clear token value
                final SharedPreferences prefs =
                    await SharedPreferences.getInstance();
                await prefs.setString('token', '');
                setState(() {
                  //refresh
                });
                MaterialPageRoute route =
                    MaterialPageRoute(builder: (context) => const Login());
                Navigator.pushAndRemoveUntil(context, route, (route) => false);
              },
              icon: const Icon(Icons.logout))
        ],
      ),
      body: Center(
        child: Text('mytoken'),
      ),
    );
  }
}
