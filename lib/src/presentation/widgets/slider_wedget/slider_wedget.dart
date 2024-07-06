import 'package:emo_diary/src/constants/decoration/decoration.dart';
import 'package:emo_diary/src/constants/text_styles/text_styles.dart';
import 'package:flutter/material.dart';

class SliderWedget extends StatefulWidget {
  const SliderWedget({
    super.key,
    required this.textf,
    required this.texts,
    required this.textth,
  });

  final String textf;
  final String texts;
  final String textth;

  @override
  _SliderWedgetState createState() => _SliderWedgetState();
}

class _SliderWedgetState extends State<SliderWedget> {
  double _sliderValue = 3;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.textf,
          style: AppTextStyles.sectionTitle,
        ),
        const SizedBox(height: 10),
        Container(
          padding: const EdgeInsets.all(16.0),
          decoration: AppDecoration.sliderContainer,
          child: Column(
            children: [
              SliderTheme(
                data: SliderThemeData(
                  activeTrackColor: const Color(0xFFE1DCD7),
                  inactiveTrackColor: const Color(0xFFE1DCD7),
                  thumbColor: Colors.white,
                  overlayColor: Colors.grey.withOpacity(0.1),
                  thumbShape:
                      const RoundSliderThumbShape(enabledThumbRadius: 12.0),
                  trackHeight: 4.0,
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
                  Text(widget.texts, style: AppTextStyles.hintText),
                  Text(widget.textth, style: AppTextStyles.hintText),
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
