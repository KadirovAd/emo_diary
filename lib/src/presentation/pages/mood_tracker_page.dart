import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MoodTrackerPage extends StatelessWidget {
  const MoodTrackerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Column(
          children: [
            Text(
              '1 января 09:00',
              style: TextStyle(
                color: Color(0xFFBCBCBF),
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            )
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.calendar_month,
              size: 30,
              color: Color(0xFFBCBCBF),
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: SizedBox(
                width: 288,
                height: 35,
                child: Stack(
                  children: [
                    Container(
                      width: 288,
                      height: 30,
                      decoration: ShapeDecoration(
                        color: const Color(0xFFF2F2F2),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(47),
                        ),
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 172,
                            height: 30,
                            decoration: ShapeDecoration(
                              color: const Color(0xFFFF8702),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(47),
                              ),
                            ),
                            child: const Center(
                              child: Text(
                                'Дневник настроения',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                          const Expanded(
                            child: Center(
                              child: Text(
                                'Статистика',
                                style: TextStyle(
                                  color: Color(0xFFBCBCBF),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
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
            const SizedBox(height: 20),
            const Text(
              'Что чувствуешь?',
              style: TextStyle(
                color: Color(0xFF4C4C68),
                fontSize: 16,
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 118,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: emotions.length,
                itemBuilder: (context, index) {
                  final emotion = emotions[index];
                  return _buildEmotionButton(
                      emotion['label']!, emotion['asset']!);
                },
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Уровень стресса',
              style: TextStyle(
                color: Color(0xFF4C4C68),
                fontSize: 16,
                fontWeight: FontWeight.w800,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        spreadRadius: 2,
                        blurRadius: 10,
                        offset: const Offset(0, 4), // Shadow position
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      SliderTheme(
                        data: SliderThemeData(
                          activeTrackColor: Colors.grey[300],
                          inactiveTrackColor: Colors.grey[300],
                          thumbColor: Colors.white,
                          overlayColor: Colors.grey.withOpacity(0.1),
                          thumbShape: const RoundSliderThumbShape(
                              enabledThumbRadius: 12.0),
                          trackHeight: 4.0,
                        ),
                        child: Slider(
                          value: 3,
                          min: 0,
                          max: 5,
                          divisions: 5,
                          onChanged: (value) {},
                          label: 'Средний',
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Низкий',
                              style: TextStyle(color: Colors.grey[500])),
                          Text('Высокий',
                              style: TextStyle(color: Colors.grey[500])),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Самооценка',
                  style: TextStyle(
                    color: Color(0xFF4C4C68),
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        spreadRadius: 2,
                        blurRadius: 10,
                        offset: const Offset(0, 4), // Shadow position
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      SliderTheme(
                        data: SliderThemeData(
                          activeTrackColor: Colors.grey[300],
                          inactiveTrackColor: Colors.grey[300],
                          thumbColor: Colors.white,
                          overlayColor: Colors.grey.withOpacity(0.1),
                          thumbShape: const RoundSliderThumbShape(
                              enabledThumbRadius: 12.0),
                          trackHeight: 4.0,
                        ),
                        child: Slider(
                          value: 3,
                          min: 0,
                          max: 5,
                          divisions: 5,
                          onChanged: (value) {},
                          label: 'Средний',
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Неуверенность',
                              style: TextStyle(color: Colors.grey[500])),
                          Text('Уверенность',
                              style: TextStyle(color: Colors.grey[500])),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Неуверенность',
                    style: TextStyle(color: Colors.grey[500])),
                Text('Уверенность', style: TextStyle(color: Colors.grey[500])),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              'Заметки',
              style: TextStyle(
                color: Color(0xFF4C4C68),
                fontSize: 16,
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(
              height: 18,
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.all(Radius.circular(12.0)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    spreadRadius: 3,
                    blurRadius: 9,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: const TextField(
                maxLines: 3,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.all(Radius.circular(12.0)),
                  ),
                  hintText: 'Введите заметку',
                  hintStyle: TextStyle(color: Color(0xFFB0B0B0)),
                  fillColor: Colors.white,
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.grey,
                  backgroundColor: const Color(0xFFF2F2F2),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 50.0, vertical: 20.0),
                  textStyle: const TextStyle(
                    fontSize: 18.0,
                  ),
                ),
                child: const Text('Сохранить'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmotionButton(String label, String asset) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          Container(
            width: 83,
            height: 118,
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(76),
              ),
              shadows: const [
                BoxShadow(
                  color: Color(0x1CB5A1C0),
                  blurRadius: 6,
                  offset: Offset(2, 4),
                  spreadRadius: 5,
                )
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                asset.endsWith('.svg')
                    ? SvgPicture.asset(asset)
                    : Image.asset(asset),
                const SizedBox(height: 8),
                Text(
                  label,
                  style: const TextStyle(
                    color: Color(0xFF4C4C68),
                    fontSize: 11,
                    fontWeight: FontWeight.w400,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

final List<Map<String, String>> emotions = [
  {'label': 'Радость', 'asset': 'assets/images/happy.png'},
  {'label': 'Страх', 'asset': 'assets/images/fear.png'},
  {'label': 'Бешенство', 'asset': 'assets/images/anger.png'},
  {'label': 'Грусть', 'asset': 'assets/images/sad.png'},
  {'label': 'Спокойствие', 'asset': 'assets/images/calm.png'},
  {'label': 'Сила', 'asset': 'assets/images/strength.png'},
];
