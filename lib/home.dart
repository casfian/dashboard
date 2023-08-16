import 'package:dashboard/login.dart';
import 'package:flutter/material.dart';
import 'package:dashboard/screens/dashboard.dart';
import 'package:dashboard/screens/profil.dart';
import 'package:dashboard/screens/utama.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List pages = [
    const Utama(),
    const Dashboard(),
    const Profil(),
  ];

  int pageIndex = 1;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: pages[pageIndex],
          bottomNavigationBar: ConvexAppBar(
            initialActiveIndex: pageIndex,
            backgroundColor: const Color.fromARGB(255, 242, 241, 241),
            color: Colors.black,
            activeColor: Colors.white,
            items: [
              TabItem(
                  icon: Image.asset(
                    'assets/images/home.png',
                  ),
                  title: 'Utama'),
              TabItem(
                  icon: Image.asset(
                    'assets/images/dashboard.png',
                  ),
                  title: 'Dashboard'),
              TabItem(
                  icon: Image.asset(
                    'assets/images/profile.png',
                  ),
                  title: 'Profil'),
            ],
            onTap: (int i) {
              pageIndex = i;
              print('click index = $i');
              print('pageindex = $pageIndex');
              setState(() {
                //utk update screen dan state
              });
            },
          )),
    );
  }
}
