import 'package:flutter/material.dart';

class DataA extends StatelessWidget {
  const DataA({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data A'),
      ),
      body: const Center(
        child: Text('Data A'),
      ),
    );
  }
}
