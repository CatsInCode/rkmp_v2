import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key, required this.title, required this.description, required this.icon});

  final String title;
  final String description;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: const Color(0xFF7FFF00), title: Text(title)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
              width: 180,
              height: 140,
              decoration: BoxDecoration(border: Border.all(color: Colors.black54), borderRadius: BorderRadius.circular(12)),
              child: Icon(icon, size: 78),
            ),
            const SizedBox(height: 20),
            Text(description, style: const TextStyle(fontSize: 22), textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}
