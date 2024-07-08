import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:paged_vertical_calendar/paged_vertical_calendar.dart';

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
    return PagedVerticalCalendar(
      monthBuilder: (context, month, year) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            DateFormat('MMMM yyyy').format(DateTime(year, month)),
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
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
            } else
              end ??= date;
          }),
          child: Container(
            margin: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: inRange ? Colors.blue : Colors.grey.shade200,
              borderRadius: BorderRadius.circular(50),
            ),
            child: Center(
              child: Text(
                DateFormat('d').format(date),
                style: TextStyle(
                  color: inRange ? Colors.white : Colors.black,
                  fontSize: 18,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
