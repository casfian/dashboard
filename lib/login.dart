import 'package:dashboard/home.dart';
import 'package:flutter/material.dart';

//utk login
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

//utk simpan token
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String? token;

  final formKey = GlobalKey<FormState>();

  bool _obscure = true;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  //function login
  Future<void> postLogin(String email, String password) async {
    var url = Uri.parse('https://myide.kerisik.com/sufia/t/api/todo/login');
    var response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: convert.jsonEncode({'login_id': email, 'password': password}),
    );

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode == 200) {
      Map<String, dynamic> jsonResponse = convert.jsonDecode(response.body);
      if (jsonResponse.containsKey('token')) {
        String mytoken = jsonResponse['token'];
        print('Token: $mytoken');
        token = mytoken;
        // Now you can use the "mytoken" variable as needed
        //simpan token
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('token', token!);

      } else {
        print('Token not found in the response');
      }
    } else {
      print('Login failed');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Form(
        key: formKey, // use this to validate the input fields in your widget!
        child: Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(60, 30, 60, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/lorry.png'),
                const Text(
                  'Login',
                  style: TextStyle(fontSize: 30),
                ),
                const SizedBox(
                  height: 40,
                ),
                TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.email,
                      color: Colors.blue,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  validator: (value) {
                    if (value == null ||
                        value.isEmpty ||
                        !value.contains('@')) {
                      return 'Please enter a valid email';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: passwordController,
                  obscureText: _obscure,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.key,
                      color: Colors.blue,
                    ),
                    suffixIcon: InkWell(
                        onTap: () {
                          if (_obscure == true) {
                            _obscure = false;
                          } else {
                            _obscure = true;
                          }
                          setState(() {});
                        },
                        child: const Icon(Icons.remove_red_eye_outlined)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: 270,
                  height: 60,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: const StadiumBorder()),
                      onPressed: () async {
                        //step 1, check dah isi semua
                        //email dan password
                        if (formKey.currentState!.validate()) {
                          await postLogin(
                              emailController.text, passwordController.text);

                          //step 2, htr login info, return token
                          //code login
                          //if ada token boleh masuk
                          //if takde token tak boleh masuk

                          if (token!.isNotEmpty) {
                            //goto to home()
                            print('Login OK!');
                            MaterialPageRoute route = MaterialPageRoute(
                                builder: (context) => const Home());
                            Navigator.push(context, route);
                          } else {
                            //failed
                            print('failed');
                          }
                        }
                      },
                      child: const Text('Log Masuk')),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
