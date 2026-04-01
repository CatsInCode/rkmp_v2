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
      home: const ApartmentFinderPage(),
    );
  }
}

class ApartmentFinderPage extends StatelessWidget {
  const ApartmentFinderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Container(
            width: 390,
            margin: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 2),
              color: const Color(0xFFE8E8E8),
            ),
            child: SingleChildScrollView(
              padding: const EdgeInsets.only(bottom: 24),
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 22),
                    color: const Color(0xFF7FFF00),
                    child: const Center(
                      child: Text(
                        'ПОДБОР КВАРТИРЫ',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w700,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  _outlinedBox(
                    child: const Text(
                      'Название ПО: EasyFlat',
                      style: TextStyle(fontSize: 32),
                      textAlign: TextAlign.center,
                    ),
                    height: 82,
                  ),
                  const SizedBox(height: 20),
                  _outlinedBox(
                    child: const Text(
                      'Описание ПО:\nПодбор квартиры по бюджету, району,\nколичеству комнат и близости к метро.',
                      style: TextStyle(fontSize: 30),
                      textAlign: TextAlign.center,
                    ),
                    height: 170,
                  ),
                  const SizedBox(height: 22),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 230,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black, width: 2),
                              color: Colors.white,
                            ),
                            child: const Center(
                              child: Icon(
                                Icons.apartment,
                                size: 120,
                                color: Colors.black87,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 22),
                        Expanded(
                          child: Container(
                            height: 230,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 14,
                              vertical: 18,
                            ),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black, width: 2),
                              color: Colors.white,
                            ),
                            child: const Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                '1. Фильтр по цене\n2. Карта районов\n3. Избранное\n4. Контакты риелторов',
                                style: TextStyle(fontSize: 28, height: 1.35),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Row(
                      children: [
                        Container(
                          width: 70,
                          height: 60,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black, width: 2),
                            color: Colors.white,
                          ),
                          child: const Icon(Icons.person_outline, size: 40),
                        ),
                        const SizedBox(width: 18),
                        Expanded(
                          child: Container(
                            height: 60,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black, width: 2),
                              color: Colors.white,
                            ),
                            child: const Center(
                              child: Text(
                                'Горохов С. А.   ИКБО-11-22',
                                style: TextStyle(fontSize: 27),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _outlinedBox({required Widget child, required double height}) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30),
      height: height,
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 2),
        color: Colors.white,
      ),
      child: Center(child: child),
    );
  }
}
