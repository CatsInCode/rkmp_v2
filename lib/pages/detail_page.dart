import 'package:flutter/material.dart';

class FeatureDetail {
  const FeatureDetail({
    required this.title,
    required this.shortDescription,
    required this.fullDescription,
    required this.icon,
    required this.imagePath,
    required this.facts,
  });

  final String title;
  final String shortDescription;
  final String fullDescription;
  final IconData icon;
  final String imagePath;
  final List<String> facts;
}

class DetailPage extends StatelessWidget {
  const DetailPage({super.key, required this.feature});

  final FeatureDetail feature;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE8E8E8),
      appBar: AppBar(
        backgroundColor: const Color(0xFF7FFF00),
        centerTitle: true,
        title: Text(feature.title),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(14),
              child: AspectRatio(
                aspectRatio: 16 / 9,
                child: Image.asset(
                  feature.imagePath,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => Container(
                    color: Colors.white,
                    child: Icon(feature.icon, size: 70),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              feature.shortDescription,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 10),
            Text(feature.fullDescription, style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 16),
            const Text(
              'Что доступно на этом экране:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            ...feature.facts.map(
              (fact) => Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 2),
                      child: Icon(Icons.check_circle_outline, size: 18),
                    ),
                    const SizedBox(width: 8),
                    Expanded(child: Text(fact)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
