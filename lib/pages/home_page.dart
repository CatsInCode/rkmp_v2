import 'dart:io' show Platform;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../widgets/app_bottom_nav.dart';
import 'detail_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<FeatureDetail> _features = const [
    FeatureDetail(
      title: 'Фильтр по цене',
      shortDescription: 'Подбор квартиры по вашему бюджету.',
      fullDescription:
          'Укажите диапазон цены и получите только те варианты, которые действительно вам подходят. Это помогает сразу убрать лишние объявления и ускорить поиск.',
      icon: Icons.sell,
      imagePath: 'assets/images/apartment_1.jpg',
      facts: [
        'Выбор минимальной и максимальной цены.',
        'Быстрый сброс фильтров в один тап.',
        'Сортировка найденных вариантов по цене.',
      ],
    ),
    FeatureDetail(
      title: 'Карта районов',
      shortDescription: 'Поиск вариантов по районам и метро.',
      fullDescription:
          'Смотрите квартиры на карте, чтобы сразу понимать удалённость от работы, метро и важных для вас точек. Так удобнее оценить расположение жилья.',
      icon: Icons.map,
      imagePath: 'assets/images/apartment_2.jpg',
      facts: [
        'Просмотр квартир по выбранному району.',
        'Оценка близости к станциям метро.',
        'Быстрый переход к карточке объявления.',
      ],
    ),
    FeatureDetail(
      title: 'Избранное',
      shortDescription: 'Сохраняйте понравившиеся объявления.',
      fullDescription:
          'Добавляйте интересные варианты в избранное, чтобы вернуться к ним позже и сравнить между собой. Это удобно, когда вариантов много.',
      icon: Icons.favorite,
      imagePath: 'assets/images/apartment_3.jpg',
      facts: [
        'Сохранение карточек в персональный список.',
        'Быстрое удаление лишних вариантов.',
        'Сравнение избранных объявлений по параметрам.',
      ],
    ),
    FeatureDetail(
      title: 'Контакты риелторов',
      shortDescription: 'Быстрая связь с владельцами и агентами.',
      fullDescription:
          'В карточке доступны контакты для связи: можно быстро уточнить детали и договориться о просмотре квартиры без лишних шагов.',
      icon: Icons.call,
      imagePath: 'assets/images/apartment_4.jpg',
      facts: [
        'Телефон и удобные способы связи.',
        'Просмотр времени, когда лучше звонить.',
        'Переход к контакту прямо из объявления.',
      ],
    ),
    FeatureDetail(
      title: 'Фото квартир',
      shortDescription: 'Сравнение планировок и состояния жилья.',
      fullDescription:
          'Изучайте фотографии и оценивайте состояние квартиры до выезда на просмотр. Это помогает сэкономить время и отобрать лучшие варианты.',
      icon: Icons.photo,
      imagePath: 'assets/images/apartment_5.jpg',
      facts: [
        'Увеличение фото для детального просмотра.',
        'Оценка комнат, кухни и санузла по снимкам.',
        'Сравнение визуального состояния вариантов.',
      ],
    ),
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
            const Text(
              'Описание ПО: Подбор квартиры по бюджету, району, количеству комнат и близости к метро.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: verticalGap),
            SizedBox(
              height: 120,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: _features.length,
                separatorBuilder: (_, __) => const SizedBox(width: 10),
                itemBuilder: (_, i) => ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Container(
                    width: 140,
                    color: Colors.white,
                    child: Image.asset(
                      _features[i].imagePath,
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) => const Icon(Icons.image, size: 48),
                    ),
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
            const Row(
              children: [
                Icon(Icons.person_outline),
                SizedBox(width: 10),
                Expanded(child: Text('Горохов С. А.  ИКБО-11-22', textAlign: TextAlign.center)),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: const AppBottomNav(currentIndex: 0),
    );
  }

  Widget _featureCard(FeatureDetail item) {
    return Card(
      child: ListTile(
        leading: Icon(item.icon),
        title: Text(item.title),
        subtitle: Text(item.shortDescription),
        trailing: const Icon(Icons.arrow_forward_ios, size: 18),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => DetailPage(feature: item)),
          );
        },
      ),
    );
  }
}
