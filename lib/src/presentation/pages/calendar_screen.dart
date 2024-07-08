import 'package:emo_diary/src/constants/text_styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:paged_vertical_calendar/paged_vertical_calendar.dart';
import 'package:emo_diary/src/presentation/pages/calendar_monthe.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

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
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          TextButton(
            onPressed: () {},
            child: Text(
              'Сегодня',
              style: AppTextStyles.appBarTitle.copyWith(fontSize: 18.sp),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(2.w),
        child: Material(
          child: PagedVerticalCalendar(
            monthBuilder: (context, month, year) {
              return Padding(
                padding: EdgeInsets.only(right: 70.w),
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
                        style: const TextStyle(
                                color: Color.fromARGB(255, 208, 208, 208),
                                fontWeight: FontWeight.w600)
                            .copyWith(fontSize: 16.sp),
                      ),
                      Text(
                        DateFormat('MMMM').format(DateTime(year, month)),
                        style:
                            AppTextStyles.monthName.copyWith(fontSize: 18.sp),
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
                  margin: EdgeInsets.all(1.w),
                  decoration: BoxDecoration(
                    color:
                        inRange ? const Color(0x3FFF8702) : Colors.transparent,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Center(
                    child: Text(
                      DateFormat('d').format(date),
                      style: AppTextStyles.dayNumber.copyWith(fontSize: 15.sp),
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
