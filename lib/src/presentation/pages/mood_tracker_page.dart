import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:emo_diary/src/constants/decoration/decoration.dart';
import 'package:emo_diary/src/constants/list_view/list_view_widget.dart';
import 'package:emo_diary/src/constants/text_styles/text_styles.dart';
import 'package:emo_diary/src/presentation/widgets/slider_wedget/slider_wedget.dart';
import 'package:emo_diary/src/presentation/pages/calendar_screen.dart';

class MoodTrackerPage extends StatefulWidget {
  const MoodTrackerPage({super.key});

  @override
  State<MoodTrackerPage> createState() => _MoodTrackerPageState();
}

class _MoodTrackerPageState extends State<MoodTrackerPage> {
  int? selectedEmotionIndex;
  List<String> selectedCategories = [];
  String? highlightedCategory;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text('1 января 09:00', style: AppTextStyles.appBarTitle),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const DatePicker(),
                ),
              );
            },
            icon: SvgPicture.asset('assets/icons/wether.svg'),
          ),
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
                        height: 35,
                        decoration: AppDecoration.switchButtonContainer,
                        child: Row(
                          children: [
                            Container(
                              width: 172,
                              height: 35,
                              decoration: AppDecoration.switchButtonActive,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  SvgPicture.asset(
                                    'assets/icons/book.svg',
                                    height: 13,
                                  ),
                                  const Text(
                                    'Дневник настроения',
                                    style: AppTextStyles.switchButtonActive,
                                  ),
                                ],
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
                    return GestureDetector(
                      onTap: () => setState(() {
                        selectedEmotionIndex = index;
                        switch (emotion['label']) {
                          case 'Радость':
                            selectedCategories = [
                              'Возбуждение',
                              'Восторг',
                              'Игривость',
                              'Наслаждение',
                              'Очарование',
                              'Осознанность',
                              'Смелость',
                              'Удовольствие',
                              'Чувственность',
                              'Энергичность',
                              'Экстравагантность'
                            ];
                            highlightedCategory = 'Чувственность';
                            break;
                          case 'Страх':
                            selectedCategories = [
                              'Тревога',
                              'Беспокойство',
                              'Нервозность',
                              'Неуверенность',
                              'Паника'
                            ];
                            highlightedCategory = 'Тревога';
                            break;
                          case 'Грусть':
                            selectedCategories = [
                              'Печаль',
                              'Уныние',
                              'Одиночество',
                              'Разочарование',
                              'Тоска'
                            ];
                            highlightedCategory = 'Печаль';
                            break;
                          case 'Бешенство':
                            selectedCategories = [
                              'Злость',
                              'Гнев',
                              'Раздражение',
                              'Ярость',
                              'Агрессия'
                            ];
                            highlightedCategory = 'Гнев';
                            break;
                          case 'Усталость':
                            selectedCategories = [
                              'Утомление',
                              'Изнеможение',
                              'Сонливость',
                              'Слабость',
                              'Выгорание'
                            ];
                            highlightedCategory = 'Утомление';
                            break;
                          default:
                            selectedCategories = [];
                            highlightedCategory = null;
                        }
                      }),
                      child: _buildEmotionButton(
                        emotion['label']!,
                        emotion['asset']!,
                        index == selectedEmotionIndex,
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),
              Wrap(
                spacing: 8.0,
                runSpacing: 8.0,
                children: selectedCategories.map((category) {
                  return Container(
                    decoration: BoxDecoration(
                      color: category == highlightedCategory
                          ? Colors.orange
                          : Colors.grey[200],
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12.0, vertical: 8.0),
                    child: Text(
                      category,
                      style: TextStyle(
                        color: category == highlightedCategory
                            ? Colors.white
                            : Colors.black,
                      ),
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(height: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SliderWedget(
                    textf: 'Уровень стресса',
                    texts: 'Низкий',
                    textth: 'Высокий',
                    highlightedCategory: highlightedCategory,
                  ),
                  const SizedBox(height: 10),
                  SliderWedget(
                    textf: 'Самооценка',
                    texts: 'Неуверенность',
                    textth: 'Уверенность',
                    highlightedCategory: highlightedCategory,
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
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
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
    );
  }

  Widget _buildEmotionButton(String label, String asset, bool isSelected) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          Container(
            width: 83,
            height: 118,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(78),
                border: Border.all(
                  color: isSelected ? Colors.orange : Colors.white,
                  width: 2,
                ),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x1CB5A1C0),
                    blurRadius: 10.80,
                    offset: Offset(3, 4),
                    spreadRadius: 10,
                  )
                ]),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                asset.endsWith('.svg')
                    ? SvgPicture.asset(
                        asset,
                        height: 50,
                      )
                    : Image.asset(
                        asset,
                        height: 50,
                      ),
                const SizedBox(height: 8),
                Text(
                  label,
                  style: AppTextStyles.emotionLabel,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
