import 'package:emo_diary/src/constants/decoration/decoration.dart';
import 'package:emo_diary/src/constants/list_view/list_view_widget.dart';
import 'package:emo_diary/src/constants/text_styles/text_styles.dart';
import 'package:emo_diary/src/presentation/pages/calendar_screen.dart';
import 'package:emo_diary/src/presentation/widgets/slider_wedget/slider_wedget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MoodTrackerPage extends StatelessWidget {
  const MoodTrackerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          title: const Column(
            children: [
              Text(
                '1 января 09:00',
                style: AppTextStyles.appBarTitle,
              ),
            ],
          ),
          actions: [
            GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CalendarScreen(),
                      ));
                },
                child: SvgPicture.asset('assets/icons/wether.svg'))
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
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
                          decoration: AppDecoration.switchButtonContainer,
                          child: Row(
                            children: [
                              Container(
                                width: 172,
                                height: 30,
                                decoration: AppDecoration.switchButtonActive,
                                child: const Center(
                                  child: Text(
                                    'Дневник настроения',
                                    style: AppTextStyles.switchButtonActive,
                                  ),
                                ),
                              ),
                              const Expanded(
                                child: Center(
                                  child: Text(
                                    'Статистика',
                                    style: AppTextStyles.switchButtonInactive,
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
                  style: AppTextStyles.sectionTitle,
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: 118,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: AppListview.emotions.length,
                    itemBuilder: (context, index) {
                      final emotion = AppListview.emotions[index];
                      return _buildEmotionButton(
                          emotion['label']!, emotion['asset']!);
                    },
                  ),
                ),
                const SizedBox(height: 20),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SliderWedget(
                      textf: 'Уровень стресса',
                      texts: 'Низкий',
                      textth: 'Высокий',
                    ),
                    SizedBox(height: 10),
                    SliderWedget(
                      textf: 'Самооценка',
                      texts: 'Неуверенность',
                      textth: 'Уверенность',
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const Text(
                  'Заметки',
                  style: AppTextStyles.sectionTitle,
                ),
                const SizedBox(
                  height: 18,
                ),
                Container(
                  decoration: AppDecoration.noteContainer,
                  child: const TextField(
                    maxLines: 3,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(Radius.circular(12.0)),
                      ),
                      hintText: 'Введите заметку',
                      hintStyle: AppTextStyles.hintText,
                      fillColor: Colors.white,
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 12.0),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                Container(
                  height: 55,
                  decoration: AppDecoration.saveContainer,
                  child: const Center(
                    child: Text(
                      'Сохранить',
                      style: AppTextStyles.saveButton,
                    ),
                  ),
                )
              ],
            ),
          ),
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
            decoration: AppDecoration.listContainer,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                asset.endsWith('.svg')
                    ? SvgPicture.asset(asset)
                    : Image.asset(asset),
                const SizedBox(height: 8),
                Text(
                  label,
                  style: AppTextStyles.emotionLabel,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
