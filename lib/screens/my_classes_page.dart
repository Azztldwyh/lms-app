import 'package:flutter/material.dart';

class MyClassesPage extends StatelessWidget {
  const MyClassesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kelas Saya'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text('Halaman Kelas Saya'),
      ),
    );
  }
}
