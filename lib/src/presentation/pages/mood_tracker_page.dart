import 'package:emo_diary/src/presentation/widgets/build_emotion_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:emo_diary/src/constants/decoration/decoration.dart';
import 'package:emo_diary/src/constants/list_view/list_view_widget.dart';
import 'package:emo_diary/src/constants/text_styles/text_styles.dart';
import 'package:emo_diary/src/presentation/widgets/slider_wedget/slider_wedget.dart';
import 'package:emo_diary/src/presentation/pages/calendar_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MoodTrackerPage extends StatefulWidget {
  const MoodTrackerPage({super.key});

  @override
  State<MoodTrackerPage> createState() => _MoodTrackerPageState();
}

class _MoodTrackerPageState extends State<MoodTrackerPage> {
  int? selectedEmotionIndex;
  List<String> selectedCategories = [];
  String? highlightedCategory;

  void _onEmotionSelected(int index, String emotionLabel) {
    setState(() {
      selectedEmotionIndex = index;
      switch (emotionLabel) {
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
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          '1 января 09:00',
          style: AppTextStyles.appBarTitle.copyWith(fontSize: 18.sp),
        ),
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
            icon: SvgPicture.asset(
              'assets/icons/wether.svg',
              height: 3.h,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(4.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: SizedBox(
                  width: 70.w,
                  height: 4.h,
                  child: Stack(
                    children: [
                      Container(
                        width: 70.w,
                        height: 4.h,
                        decoration: AppDecoration.switchButtonContainer,
                        child: Row(
                          children: [
                            Container(
                              width: 42.w,
                              height: 5.h,
                              decoration: AppDecoration.switchButtonActive,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  SvgPicture.asset(
                                    'assets/icons/book.svg',
                                    height: 1.5.h,
                                  ),
                                  Text(
                                    'Дневник настроения',
                                    style: AppTextStyles.switchButtonActive
                                        .copyWith(fontSize: 14.sp),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Center(
                                child: Text(
                                  'Статистика',
                                  style: AppTextStyles.switchButtonInactive
                                      .copyWith(fontSize: 13.sp),
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
              SizedBox(height: 2.h),
              Text(
                'Что чувствуешь?',
                style: AppTextStyles.sectionTitle.copyWith(fontSize: 16.sp),
              ),
              SizedBox(height: 1.h),
              SizedBox(
                height: 17.h,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: AppListview.emotions.length,
                  itemBuilder: (context, index) {
                    final emotion = AppListview.emotions[index];
                    return GestureDetector(
                      onTap: () => _onEmotionSelected(index, emotion['label']!),
                      child: BuildEmotionButton(
                        asset: emotion['asset']!,
                        isSelected: index == selectedEmotionIndex,
                        label: emotion['label']!,
                      ),
                    );
                  },
                ),
              ),
              Wrap(
                spacing: 2.w,
                runSpacing: 2.w,
                children: selectedCategories.map((category) {
                  return Container(
                    decoration: BoxDecoration(
                      color: category == highlightedCategory
                          ? Colors.orange
                          : Colors.grey[200],
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    padding:
                        EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.h),
                    child: Text(
                      category,
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: category == highlightedCategory
                            ? Colors.white
                            : Colors.black,
                      ),
                    ),
                  );
                }).toList(),
              ),
              SizedBox(height: 2.h),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SliderWedget(
                    textf: 'Уровень стресса',
                    texts: 'Низкий',
                    textth: 'Высокий',
                    highlightedCategory: highlightedCategory,
                  ),
                  SizedBox(height: 1.h),
                  SliderWedget(
                    textf: 'Самооценка',
                    texts: 'Неуверенность',
                    textth: 'Уверенность',
                    highlightedCategory: highlightedCategory,
                  ),
                ],
              ),
              SizedBox(height: 2.h),
              Text(
                'Заметки',
                style: AppTextStyles.sectionTitle.copyWith(fontSize: 18.sp),
              ),
              SizedBox(height: 2.h),
              Container(
                decoration: AppDecoration.noteContainer,
                child: TextField(
                  maxLines: 3,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(Radius.circular(12.0)),
                    ),
                    hintText: 'Введите заметку',
                    hintStyle: AppTextStyles.hintText.copyWith(fontSize: 14.sp),
                    fillColor: Colors.white,
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
                  ),
                ),
              ),
              SizedBox(height: 4.h),
              Container(
                height: 6.h,
                decoration: AppDecoration.saveContainer,
                child: Center(
                  child: Text(
                    'Сохранить',
                    style: AppTextStyles.saveButton.copyWith(fontSize: 16.sp),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
