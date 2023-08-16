import 'package:flutter/material.dart';

class Utama extends StatelessWidget {
  const Utama({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Utama'),
      ),
      body: const Center(
        child: Text('Utama'),
      ),
    );
  }
}
