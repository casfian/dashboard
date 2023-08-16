import 'package:dashboard/home.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String? token = 'tytrytryryertyre';

  final formKey = GlobalKey<FormState>();

  bool _obscure = true;

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
                          setState(() {
                            
                          });
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
                      onPressed: () {
                        //step 1, check dah isi semua
                        //email dan password
                        if (formKey.currentState!.validate()) {
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
