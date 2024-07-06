import 'package:flutter/material.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  _CalendarScreenState createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  DateTime _focusedDay = DateTime.now();
  DateTime _selectedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Календарь'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      YearlyCalendarView(selectedYear: DateTime.now()),
                ),
              );
            },
            child: const Text(
              'Годовой вид',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          _buildHeader(),
          _buildDaysOfWeek(),
          _buildDaysGrid(),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              setState(() {
                _focusedDay = DateTime(_focusedDay.year, _focusedDay.month - 1);
              });
            },
          ),
          Column(
            children: [
              Text(
                '${_focusedDay.year}',
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(
                _monthName(_focusedDay.month),
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          IconButton(
            icon: const Icon(Icons.arrow_forward),
            onPressed: () {
              setState(() {
                _focusedDay = DateTime(_focusedDay.year, _focusedDay.month + 1);
              });
            },
          ),
        ],
      ),
    );
  }

  Widget _buildDaysOfWeek() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: ['ПН', 'ВТ', 'СР', 'ЧТ', 'ПТ', 'СБ', 'ВС'].map((e) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            e,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildDaysGrid() {
    final daysInMonth =
        DateTime(_focusedDay.year, _focusedDay.month + 1, 0).day;
    final firstWeekday =
        DateTime(_focusedDay.year, _focusedDay.month, 1).weekday;
    final totalCells = daysInMonth + firstWeekday - 1;

    return Expanded(
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 7,
          childAspectRatio: 1.2,
        ),
        itemCount: totalCells,
        itemBuilder: (context, index) {
          if (index < firstWeekday - 1) {
            return Container();
          } else {
            final day = index - firstWeekday + 2;
            return GestureDetector(
              onTap: () {
                setState(() {
                  _selectedDay =
                      DateTime(_focusedDay.year, _focusedDay.month, day);
                });
              },
              child: Container(
                margin: const EdgeInsets.all(4.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _selectedDay ==
                          DateTime(_focusedDay.year, _focusedDay.month, day)
                      ? Colors.blue
                      : Colors.transparent,
                ),
                child: Center(
                  child: Text(
                    day.toString(),
                    style: TextStyle(
                      color: _selectedDay ==
                              DateTime(_focusedDay.year, _focusedDay.month, day)
                          ? Colors.white
                          : Colors.black,
                    ),
                  ),
                ),
              ),
            );
          }
        },
      ),
    );
  }

  String _monthName(int month) {
    switch (month) {
      case 1:
        return 'Январь';
      case 2:
        return 'Февраль';
      case 3:
        return 'Март';
      case 4:
        return 'Апрель';
      case 5:
        return 'Май';
      case 6:
        return 'Июнь';
      case 7:
        return 'Июль';
      case 8:
        return 'Август';
      case 9:
        return 'Сентябрь';
      case 10:
        return 'Октябрь';
      case 11:
        return 'Ноябрь';
      case 12:
        return 'Декабрь';
      default:
        return '';
    }
  }
}

class YearlyCalendarView extends StatelessWidget {
  final DateTime selectedYear;

  const YearlyCalendarView({super.key, required this.selectedYear});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Yearly Calendar'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text(
              'Month View',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 1.2,
        ),
        itemCount: 12,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text(
                  '${_monthName(index + 1)} ${selectedYear.year}',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Expanded(
                  child: _buildDaysGrid(DateTime(selectedYear.year, index + 1)),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildDaysGrid(DateTime month) {
    final daysInMonth = DateTime(month.year, month.month + 1, 0).day;
    final firstWeekday = DateTime(month.year, month.month, 1).weekday;
    final totalCells = daysInMonth + firstWeekday - 1;

    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 7,
        childAspectRatio: 1.2,
      ),
      physics: const NeverScrollableScrollPhysics(),
      itemCount: totalCells,
      itemBuilder: (context, index) {
        if (index < firstWeekday - 1) {
          return Container();
        } else {
          final day = index - firstWeekday + 2;
          return Center(
            child: Text(day.toString()),
          );
        }
      },
    );
  }

  String _monthName(int month) {
    switch (month) {
      case 1:
        return 'Январь';
      case 2:
        return 'Февраль';
      case 3:
        return 'Март';
      case 4:
        return 'Апрель';
      case 5:
        return 'Май';
      case 6:
        return 'Июнь';
      case 7:
        return 'Июль';
      case 8:
        return 'Август';
      case 9:
        return 'Сентябрь';
      case 10:
        return 'Октябрь';
      case 11:
        return 'Ноябрь';
      case 12:
        return 'Декабрь';
      default:
        return '';
    }
  }
}
