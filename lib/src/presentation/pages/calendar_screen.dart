import 'package:emo_diary/src/constants/text_styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:paged_vertical_calendar/paged_vertical_calendar.dart';
import 'package:emo_diary/src/presentation/pages/calendar_monthe.dart';

class DatePicker extends StatefulWidget {
  const DatePicker({super.key});

  @override
  State<DatePicker> createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  DateTime? start;
  DateTime? end;

  bool isInRange(DateTime date) {
    if (start == null || end == null) return false;
    return date.compareTo(start!) >= 0 && date.compareTo(end!) <= 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text(
              'Сегодня',
              style: AppTextStyles.appBarTitle,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Material(
          child: PagedVerticalCalendar(
            monthBuilder: (context, month, year) {
              return Padding(
                padding: const EdgeInsets.only(right: 290),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CalendarView(),
                      ),
                    );
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        DateFormat('yyyy').format(DateTime(year, month)),
                        style: AppTextStyles.sectionTitle,
                      ),
                      Text(
                        DateFormat('MMMM').format(DateTime(year, month)),
                        style: AppTextStyles.monthName,
                      ),
                    ],
                  ),
                ),
              );
            },
            dayBuilder: (context, date) {
              bool inRange = isInRange(date);
              return GestureDetector(
                onTap: () => setState(() {
                  if (start == null || (start != null && end != null)) {
                    start = date;
                    end = null;
                  } else {
                    end ??= date;
                  }
                }),
                child: Container(
                  margin: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: inRange ? const Color(0x3FFF8702) : Colors.white,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Center(
                    child: Text(
                      DateFormat('d').format(date),
                      style: AppTextStyles.dayNumber,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
