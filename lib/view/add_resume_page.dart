import 'package:flutter/material.dart';

class AddResumePage extends StatelessWidget {
  const AddResumePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF151515),
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Add Resume',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFF0ab6ab),
      ),
    );
  }
}
