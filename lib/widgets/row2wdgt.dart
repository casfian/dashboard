import 'package:flutter/material.dart';

class Row2Wdgt extends StatelessWidget {
  const Row2Wdgt({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.fromLTRB(20, 30, 20, 30),
      child: Row(
        children: [
          Text(
            'Data Terperinci',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
