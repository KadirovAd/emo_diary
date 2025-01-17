import 'package:flutter/material.dart';
import 'package:emo_diary/src/constants/decoration/decoration.dart';
import 'package:emo_diary/src/constants/text_styles/text_styles.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SliderWedget extends StatefulWidget {
  const SliderWedget({
    super.key,
    required this.textf,
    required this.texts,
    required this.textth,
    required this.highlightedCategory,
  });

  final String textf;
  final String texts;
  final String textth;
  final String? highlightedCategory;

  @override
  _SliderWedgetState createState() => _SliderWedgetState();
}

class _SliderWedgetState extends State<SliderWedget> {
  double _sliderValue = 3;

  @override
  Widget build(BuildContext context) {
    final bool isHighlighted = widget.highlightedCategory != null;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.textf,
          style: AppTextStyles.sectionTitle.copyWith(fontSize: 18.sp),
        ),
        SizedBox(height: 2.h),
        Container(
          padding: EdgeInsets.all(4.w),
          decoration: AppDecoration.sliderContainer.copyWith(
            boxShadow: [
              const BoxShadow(
                color: Color.fromARGB(28, 0, 0, 0),
                blurRadius: 10,
                offset: Offset(2, 4),
                spreadRadius: 5,
              ),
            ],
          ),
          child: Column(
            children: [
              SliderTheme(
                data: SliderThemeData(
                  activeTrackColor:
                      isHighlighted ? Colors.orange : const Color(0xFFE1DCD7),
                  thumbColor: isHighlighted ? Colors.orange : Colors.white,
                  thumbShape:
                      const RoundSliderThumbShape(enabledThumbRadius: 12.0),
                  trackHeight: 0.5.h,
                ),
                child: Slider(
                  value: _sliderValue,
                  min: 0,
                  max: 5,
                  divisions: 5,
                  onChanged: (value) {
                    setState(() {
                      _sliderValue = value;
                    });
                  },
                  label: _getSliderLabel(_sliderValue),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(widget.texts,
                      style: AppTextStyles.hintText.copyWith(fontSize: 14.sp)),
                  Text(widget.textth,
                      style: AppTextStyles.hintText.copyWith(fontSize: 14.sp)),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  String _getSliderLabel(double value) {
    if (value == 0) return 'Очень низкий';
    if (value == 1) return 'Низкий';
    if (value == 2) return 'Ниже среднего';
    if (value == 3) return 'Средний';
    if (value == 4) return 'Выше среднего';
    return 'Высокий';
  }
}
