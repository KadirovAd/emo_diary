import 'package:emo_diary/src/constants/text_styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CalendarView extends StatelessWidget {
  const CalendarView({super.key});

  List<Widget> buildYearWidgets(BuildContext context) {
    DateTime now = DateTime.now();
    List<Widget> yearWidgets = [];
    for (int year = now.year; year <= now.year; year++) {
      yearWidgets.add(buildYearWidget(context, year));
    }
    return yearWidgets;
  }

  Widget buildYearWidget(BuildContext context, int year) {
    List<String> monthNames = const <String>[
      'Январь',
      'Февраль',
      'Март',
      'Апрель',
      'Май',
      'Июнь',
      'Июль',
      'Август',
      'Сентябрь',
      'Октябрь',
      'Ноябрь',
      'Декабрь'
    ];

    List<Widget> firstColumn = [];
    List<Widget> secondColumn = [];

    for (int i = 0; i < 12; i++) {
      Widget monthWidget =
          buildMonthWidget(context, monthNames[i], DateTime(year, i + 1));
      if (i % 2 == 0) {
        firstColumn.add(monthWidget);
      } else {
        secondColumn.add(monthWidget);
      }
    }

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 2.h),
          child: Center(
            child: Text(
              year.toString(),
              style: AppTextStyles.sectionTitle.copyWith(fontSize: 18.sp),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(children: firstColumn),
            Column(children: secondColumn),
          ],
        ),
      ],
    );
  }

  Widget buildMonthWidget(
      BuildContext context, String monthName, DateTime monthDate) {
    int daysInMonth = DateUtils.getDaysInMonth(monthDate.year, monthDate.month);
    DateTime firstDayOfMonth = DateTime(monthDate.year, monthDate.month, 1);
    int firstWeekday = firstDayOfMonth.weekday;

    List<Widget> dayWidgets =
        List<Widget>.generate(firstWeekday - 1, (_) => const SizedBox.shrink());

    dayWidgets.addAll(List<Widget>.generate(daysInMonth, (i) {
      int day = i + 1;
      bool isToday = DateTime.now()
          .isAtSameMomentAs(DateTime(monthDate.year, monthDate.month, day));
      return Container(
        width: 10.w,
        height: 10.w,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isToday ? Colors.orange : Colors.transparent,
        ),
        child: Center(
          child: Text(
            day.toString(),
            style: TextStyle(
              color: isToday ? Colors.white : Colors.black,
              fontSize: 14.sp,
            ),
          ),
        ),
      );
    }));

    return Padding(
      padding: EdgeInsets.all(1.w),
      child: SizedBox(
        width: 45.w,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              monthName,
              style: TextStyle(
                  fontSize: 16.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.w700),
            ),
            SizedBox(height: 1.h),
            GridView.count(
              crossAxisCount: 7,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: dayWidgets,
            ),
          ],
        ),
      ),
    );
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
              )),
        ],
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(2.w),
          child: Column(
            children: buildYearWidgets(context),
          ),
        ),
      ),
    );
  }
}
