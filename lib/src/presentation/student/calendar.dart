import 'dart:math';

import 'package:flutter/material.dart';
import 'package:masters_pms/src/models/db_controllers.dart';
import 'package:masters_pms/src/models/models.dart';
import 'package:masters_pms/src/models/widgets.dart';
import 'package:table_calendar/table_calendar.dart';

class calendar extends StatefulWidget {
  const calendar({super.key});

  @override
  State<calendar> createState() => _calendarState();
}

class _calendarState extends State<calendar> {
  late final ValueNotifier<List<Task>> _selectedEvents;
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  List<Task> _getEvents() {
    Random random = new Random();
    var index = random.nextInt(3);
    var stage = ['Research', 'Proposal', 'Review'][index];

    var taskLen = random.nextInt(3);
    List<Task> tasks = TaskService.fetchFreeTasks(stage);

    return tasks.sublist(0, taskLen);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _selectedEvents = ValueNotifier(_getEvents());
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            width: double.infinity,
            padding: EdgeInsets.only(top: 100, bottom: 16.0),
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 37, 50, 56),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25))),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                "Schedule",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.w700),
                textAlign: TextAlign.center,
              ),
            )),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: const Color.fromARGB(255, 134, 255, 138),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 16.0),
                    child: Row(
                      children: [
                        Icon(Icons.add, color: Colors.green[900]),
                        Text(
                          "Add",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.green[900]),
                        ),
                      ],
                    ),
                  ))
            ],
          ),
        ),
        TableCalendar(
          firstDay: DateTime.utc(2010, 10, 16),
          lastDay: DateTime.utc(2030, 3, 14),
          focusedDay: DateTime.now(),
          headerVisible: true,
          daysOfWeekVisible: true,
          sixWeekMonthsEnforced: true,
          shouldFillViewport: false,
          headerStyle: HeaderStyle(
              titleTextStyle: TextStyle(
                  fontSize: 20,
                  color: Color.fromARGB(255, 37, 50, 56),
                  fontWeight: FontWeight.w800)),
          calendarStyle: CalendarStyle(
              todayTextStyle: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold)),
          calendarFormat: _calendarFormat,
          selectedDayPredicate: (day) {
            return isSameDay(_selectedDay, day);
          },
          onDaySelected: (selectedDay, focusedDay) {
            if (!isSameDay(_selectedDay, selectedDay)) {
              setState(() {
                _selectedDay = selectedDay;
                _focusedDay = focusedDay;
              });
              _selectedEvents.value = _getEvents();
            }
          },
          onFormatChanged: (format) {
            if (_calendarFormat != format) {
              // Call `setState()` when updating calendar format
              setState(() {
                _calendarFormat = format;
              });
            }
          },
          onPageChanged: (focusedDay) {
            // No need to call `setState()` here
            _focusedDay = focusedDay;
          },
          eventLoader: (day) {
            return _getEvents();
          },
        ),
        SizedBox(height: 10.0),
        Expanded(
          child: ValueListenableBuilder<List<Task>>(
            valueListenable: _selectedEvents,
            builder: (context, value, _) {
              return ListView.builder(
                itemCount: value.length,
                itemBuilder: (context, index) {
                  var task = value[index];
                  Topic topic = TopicService.fetchTopic(task.topic);
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
                    child: Container(
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 220, 220, 220),
                            borderRadius: BorderRadius.all(Radius.circular(10))
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                              Text(
                                task.title,
                                style: TextStyle(
                                    fontWeight: FontWeight.w600, fontSize: 16)
                                ),
                              Text(
                                topic.title,
                                style: TextStyle(
                                    fontWeight: FontWeight.w300, fontSize: 13,
                                    ),
                                ),
                              Divider(
                                thickness: 1,
                              ),
                              Text(task.time)
                            ]),
                          )),
                  )
                  ;
                },
              );
            },
          ),
        )
      ],
    );
  }
}
