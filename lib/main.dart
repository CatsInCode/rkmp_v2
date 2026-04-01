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

  static const String _titleFontFamily = 'ApartmentTitle';

  static const List<String> _imagePaths = [
    'assets/images/apartment_1.jpg',
    'assets/images/apartment_2.jpg',
    'assets/images/apartment_3.jpg',
    'assets/images/apartment_4.jpg',
    'assets/images/apartment_5.jpg',
  ];

  static const List<_FeatureItem> _features = [
    _FeatureItem('Фильтр по цене', 'Подбор квартир в заданном бюджете', Icons.sell),
    _FeatureItem('Карта районов', 'Просмотр объявлений по районам города', Icons.map),
    _FeatureItem('Избранное', 'Сохранение понравившихся вариантов', Icons.favorite),
    _FeatureItem('Контакты риелторов', 'Быстрая связь с агентами и владельцами', Icons.call),
    _FeatureItem('Фото квартир', 'Просмотр фото и сравнение вариантов', Icons.photo),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE8E8E8),
      appBar: AppBar(
        backgroundColor: const Color(0xFF7FFF00),
        centerTitle: true,
        title: const Text(
          'ПОДБОР КВАРТИРЫ',
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontFamily: _titleFontFamily,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
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
              const SizedBox(height: 12),
              SizedBox(
                height: 160,
                child: ListView.separated(
                  key: const ValueKey('horizontal-image-list'),
                  scrollDirection: Axis.horizontal,
                  itemCount: _imagePaths.length,
                  separatorBuilder: (context, index) => const SizedBox(width: 12),
                  itemBuilder: (context, index) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Container(
                        width: 220,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black54),
                          color: Colors.white,
                        ),
                        child: Image.asset(
                          _imagePaths[index],
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return const Center(
                              child: Icon(Icons.apartment, size: 70),
                            );
                          },
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                height: 340,
                child: ListView.separated(
                  key: const ValueKey('feature-list'),
                  itemCount: _features.length,
                  separatorBuilder: (context, index) => const SizedBox(height: 10),
                  itemBuilder: (context, index) {
                    final item = _features[index];
                    return Card(
                      child: ListTile(
                        leading: Icon(item.icon, color: Colors.green.shade700),
                        title: Text(item.title),
                        subtitle: Text(item.description),
                        trailing: const Icon(Icons.arrow_forward_ios, size: 18),
                        onTap: () {
                          ScaffoldMessenger.of(context)
                            ..hideCurrentSnackBar()
                            ..showSnackBar(
                              SnackBar(
                                content: Text('Выбран пункт: ${item.title}'),
                                duration: const Duration(seconds: 2),
                              ),
                            );
                        },
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 14),
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

class _FeatureItem {
  const _FeatureItem(this.title, this.description, this.icon);

  final String title;
  final String description;
  final IconData icon;
}
