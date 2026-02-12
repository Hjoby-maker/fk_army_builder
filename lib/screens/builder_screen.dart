import 'package:flutter/material.dart';

class BuilderScreen extends StatelessWidget {
  const BuilderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Конструктор армий'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.build, size: 64, color: Colors.green),
            SizedBox(height: 16),
            Text(
              'Конструктор армий',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text('В разработке...'),
          ],
        ),
      ),
    );
  }
}