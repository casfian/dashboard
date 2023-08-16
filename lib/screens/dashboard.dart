import 'package:dashboard/login.dart';
import 'package:flutter/material.dart';
import 'package:dashboard/widgets/row1wdgt.dart';
import 'package:dashboard/widgets/row2wdgt.dart';
import 'package:dashboard/widgets/row3wdgt.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        centerTitle: false,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {
              //code
              MaterialPageRoute route =
                  MaterialPageRoute(builder: (context) => const Login());
              Navigator.pushAndRemoveUntil(context, route, (route) => false);
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      drawer: const Drawer(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              children: [
                Container(
                  width: 393,
                  height: 200,
                  color: Colors.blue,
                ),

                //row1
                const Padding(
                  padding: EdgeInsets.only(top: 60.0),
                  child: Row1Wdgt(),
                ),
              ],
            ),

            //row2
            const Row2Wdgt(),
            //row3
            const Row3Wdgt(),
          ],
        ),
      ),
    );
  }
}
