import 'dart:io' show Platform;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../routes.dart';
import 'detail_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<_FeatureItem> _features = const [
    _FeatureItem('Фильтр по цене', 'Подбор квартиры по вашему бюджету', Icons.sell),
    _FeatureItem('Карта районов', 'Поиск вариантов по районам и метро', Icons.map),
    _FeatureItem('Избранное', 'Сохраняйте понравившиеся объявления', Icons.favorite),
    _FeatureItem('Контакты риелторов', 'Быстрая связь с владельцами и агентами', Icons.call),
    _FeatureItem('Фото квартир', 'Сравнение планировок и состояния жилья', Icons.photo),
  ];

  final List<String> _imagePaths = const [
    'assets/images/apartment_1.jpg',
    'assets/images/apartment_2.jpg',
    'assets/images/apartment_3.jpg',
    'assets/images/apartment_4.jpg',
    'assets/images/apartment_5.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);
    final isWide = media.size.width > 600;
    final isDesktop = kIsWeb || Platform.isMacOS || Platform.isLinux || Platform.isWindows;
    final verticalGap = isDesktop ? 16.0 : 8.0;

    return Scaffold(
      backgroundColor: const Color(0xFFE8E8E8),
      appBar: AppBar(
        backgroundColor: const Color(0xFF7FFF00),
        centerTitle: true,
        title: const Text('ПОДБОР КВАРТИРЫ'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: verticalGap),
        child: Column(
          children: [
            const Text('Название ПО: EasyFlat', style: TextStyle(fontSize: 24)),
            SizedBox(height: verticalGap),
            const Text('Описание ПО: Подбор квартиры по бюджету, району, количеству комнат и близости к метро.', textAlign: TextAlign.center, style: TextStyle(fontSize: 20)),
            SizedBox(height: verticalGap),
            SizedBox(
              height: 120,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: _imagePaths.length,
                separatorBuilder: (_, __) => const SizedBox(width: 10),
                itemBuilder: (_, i) => ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Container(
                    width: 140,
                    color: Colors.white,
                    child: Image.asset(_imagePaths[i], fit: BoxFit.cover, errorBuilder: (_,__,___)=>const Icon(Icons.image,size:48)),
                  ),
                ),
              ),
            ),
            SizedBox(height: verticalGap),
            Expanded(
              child: isWide
                  ? GridView.builder(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 12,
                        crossAxisSpacing: 12,
                        childAspectRatio: 3,
                      ),
                      itemCount: _features.length,
                      itemBuilder: (_, index) => _featureCard(_features[index]),
                    )
                  : ListView.separated(
                      itemCount: _features.length,
                      separatorBuilder: (_, __) => SizedBox(height: verticalGap),
                      itemBuilder: (_, index) => _featureCard(_features[index]),
                    ),
            ),
            SizedBox(height: verticalGap),
            Row(
              children: const [
                Icon(Icons.person_outline),
                SizedBox(width: 10),
                Expanded(child: Text('Горохов С. А.  ИКБО-11-22', textAlign: TextAlign.center)),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: 0,
        onDestinationSelected: (index) {
          if (index == 1) {
            Navigator.pushReplacementNamed(context, Routes.profile);
          }
        },
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home_outlined), selectedIcon: Icon(Icons.home), label: 'Главная'),
          NavigationDestination(icon: Icon(Icons.person_outline), selectedIcon: Icon(Icons.person), label: 'Профиль'),
        ],
      ),
    );
  }

  Widget _featureCard(_FeatureItem item) {
    return Card(
      child: ListTile(
        leading: Icon(item.icon),
        title: Text(item.title),
        subtitle: Text(item.description),
        trailing: const Icon(Icons.arrow_forward_ios, size: 18),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => DetailPage(
                title: item.title,
                description: item.description,
                icon: item.icon,
              ),
            ),
          );
        },
      ),
    );
  }
}

class _FeatureItem {
  const _FeatureItem(this.title, this.description, this.icon);
  final String title;
  final String description;
  final IconData icon;
}
