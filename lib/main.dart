import 'package:flutter/material.dart';

void main() {
  runApp(const ApartmentFinderApp());
}

class ApartmentFinderApp extends StatelessWidget {
  const ApartmentFinderApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Подбор квартиры',
      theme: ThemeData(useMaterial3: true),
      home: const ApartmentFinderPage(),
    );
  }
}

class ApartmentFinderPage extends StatelessWidget {
  const ApartmentFinderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE8E8E8),
      appBar: AppBar(
        backgroundColor: const Color(0xFF7FFF00),
        centerTitle: true,
        title: const Text(
          'ПОДБОР КВАРТИРЫ',
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              _outlinedBox(
                height: 70,
                child: const Text(
                  'Название ПО: EasyFlat',
                  style: TextStyle(fontSize: 24),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 16),
              _outlinedBox(
                height: 130,
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    'Описание ПО:\nПодбор квартиры по бюджету, району,\nколичеству комнат и близости к метро.',
                    style: TextStyle(fontSize: 22),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              const Divider(thickness: 2),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 190,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 2),
                        color: Colors.white,
                      ),
                      child: const Center(
                        child: Icon(Icons.apartment, size: 90),
                      ),
                    ),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Container(
                      height: 190,
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 2),
                        color: Colors.white,
                      ),
                      child: const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          '1. Фильтр по цене\n2. Карта районов\n3. Избранное\n4. Контакты риелторов',
                          style: TextStyle(fontSize: 20, height: 1.4),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              const Divider(thickness: 2),
              const SizedBox(height: 16),
              Row(
                children: [
                  Container(
                    width: 60,
                    height: 52,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 2),
                      color: Colors.white,
                    ),
                    child: const Icon(Icons.person_outline, size: 34),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Container(
                      height: 52,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 2),
                        color: Colors.white,
                      ),
                      child: const Center(
                        child: Text(
                          'Горохов С. А.  ИКБО-11-22',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _outlinedBox({required double height, required Widget child}) {
    return Container(
      width: double.infinity,
      height: height,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 2),
        color: Colors.white,
      ),
      child: Center(child: child),
    );
  }
}
