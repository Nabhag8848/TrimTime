import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/material.dart';
import 'package:frontend/routes.dart';

class SelectTimePage extends StatefulWidget {
  const SelectTimePage({super.key});

  @override
  State<SelectTimePage> createState() => _SelectTimePageState();
}

class _SelectTimePageState extends State<SelectTimePage> {
  final EventController _controller = EventController();

  @override
  void initState() {
    addEvents();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Select Time Slot")),
      body: DayView(
        heightPerMinute: 1,
        headerStyle: const HeaderStyle(
          headerTextStyle: TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.background,
        controller: _controller,
        eventTileBuilder: (date, events, boundry, start, end) {
          return Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(10.0),
              ),
            ),
            child: Text(
              events.first.title,
              style: TextStyle(
                color: Theme.of(context).colorScheme.onPrimary,
              ),
            ),
          );
        },
        fullDayEventBuilder: (events, date) {
          return Container();
        },
        showVerticalLine: true,
        showLiveTimeLineInAllDays: true,
        minDay: DateTime.now(),
        maxDay: DateTime.now().add(const Duration(days: 7)),
        initialDay: DateTime.now(),
        onDateTap: (date) {
          Navigator.of(context).pushReplacementNamed(
            Routes.availableShops,
            arguments: "${date.hour}-${date.hour+1}pm"
          );
        },
        onEventTap: (events, date) => print(events),
        onDateLongPress: (date) => print(date),
      ),
    );
  }

  void addEvents() {
    var date = DateTime.now();
    _controller.add(CalendarEventData(
      title: "Rahul's Haircut",
      date: date,
      startTime: DateTime(date.year, date.month, date.day, 9),
      endTime: DateTime(date.year, date.month, date.day, 10),
    ));

    _controller.add(CalendarEventData(
      title: "Mohit's Hair Color",
      date: date,
      startTime: DateTime(date.year, date.month, date.day, 15),
      endTime: DateTime(date.year, date.month, date.day, 16),
    ));
  }
}
