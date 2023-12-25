import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import '../table%20calender/utils.dart';

@RoutePage()
class CalenderScreen extends StatefulWidget {
  const CalenderScreen({super.key});

  @override
  State<CalenderScreen> createState() => _CalenderScreenState();
}

class _CalenderScreenState extends State<CalenderScreen> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: TableEventsExample(),
    );
  }
}

class TableEventsExample extends StatefulWidget {
  const TableEventsExample({super.key});

  @override
  _TableEventsExampleState createState() => _TableEventsExampleState();
}

class _TableEventsExampleState extends State<TableEventsExample> {
  late final ValueNotifier<List<Event>> _selectedEvents;
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  void initState() {
    super.initState();

    _selectedDay = _focusedDay;
    _selectedEvents = ValueNotifier(_getEventsForDay(_selectedDay!));
  }

  @override
  void dispose() {
    _selectedEvents.dispose();
    super.dispose();
  }

  List<Event> _getEventsForDay(DateTime day) {
    // Implementation example
    return kEvents[day] ?? [];
  }

  List<Event> _getEventsForRange(DateTime start, DateTime end) {
    // Implementation example
    final days = daysInRange(start, end);

    return [
      for (final d in days) ..._getEventsForDay(d),
    ];
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    if (!isSameDay(_selectedDay, selectedDay)) {
      setState(() {
        _selectedDay = selectedDay;
        _focusedDay = focusedDay;
      });

      _selectedEvents.value = _getEventsForDay(selectedDay);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TableCalendar - Events'),
      ),
      body: Column(
        children: [
          TableCalendar<Event>(
            firstDay: kFirstDay,
            lastDay: kLastDay,
            focusedDay: _focusedDay,
            selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
            calendarFormat: _calendarFormat,
            eventLoader: _getEventsForDay,
            startingDayOfWeek: StartingDayOfWeek.monday,
            calendarStyle: const CalendarStyle(
              // Use `CalendarStyle` to customize the UI
              outsideDaysVisible: false,
            ),
            onDaySelected: _onDaySelected,
            onFormatChanged: (format) {
              if (_calendarFormat != format) {
                setState(() {
                  _calendarFormat = format;
                });
              }
            },
            onPageChanged: (focusedDay) {
              _focusedDay = focusedDay;
            },
          ),
          const SizedBox(height: 8),
          const Expanded(
            child: AddUser(),

            // child: ValueListenableBuilder<List<Event>>(
            //   valueListenable: _selectedEvents,
            //   builder: (context, value, _) {
            //     return ListView.builder(
            //       itemCount: value.length,
            //       itemBuilder: (context, index) {
            //         return Container(
            //           margin: const EdgeInsets.symmetric(
            //             horizontal: 12,
            //             vertical: 4,
            //           ),
            //           decoration: BoxDecoration(
            //             border: Border.all(),
            //             borderRadius: BorderRadius.circular(12),
            //           ),
            //           child: ListTile(
            //             onTap: () => print('${value[index]}'),
            //             title: Text('${value[index]}'),
            //           ),
            //         );
            //       },
            //     );
            //   },
            // ),
          ),
        ],
      ),
    );
  }
}

class AddUser extends StatelessWidget {
  const AddUser({super.key});

  @override
  Widget build(BuildContext context) {
    // Create a CollectionReference called users that references the firestore collection
    final CollectionReference users = FirebaseFirestore.instance.collection('users');
    final Stream<QuerySnapshot> usersStream = FirebaseFirestore.instance.collection('users').snapshots();

    Future<void> addUser() {
      // Call the user's CollectionReference to add a new user
      return users
          .add({
            'full_name': 'fullName', // John Doe
            'company': 'company', // Stokes and Sons
            'age': 'age', // 42
          })
          .then((value) => print('User Added'))
          .catchError((error) => print('Failed to add user: $error'));
    }

    return StreamBuilder<QuerySnapshot>(
      stream: usersStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text('Loading');
        }

        return ListView(
          children: snapshot.data!.docs
              .map((DocumentSnapshot document) {
                final data = document.data()! as Map<String, dynamic>;
                return Container(
                  child: ListTile(
                    title: Text(data['full_name'].toString()),
                    subtitle: Text(data['company'].toString()),
                  ),
                );
              })
              .toList()
              .cast(),
        );
      },
    );
  }
}

class GetMetricsWidget extends StatelessWidget {
  const GetMetricsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();
    Future<void> addMessageToGuestBook() {
      final user = <String, dynamic>{'first': 'Ada', 'last': 'Lovelace', 'born': 1815};

      final db = FirebaseFirestore.instance;
      return db.collection('users').add(user).then((DocumentReference doc) => print('DocumentSnapshot added with ID: ${doc.id}'));
    }

    return Padding(
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              controller: controller,
              decoration: const InputDecoration(
                hintText: 'Leave a message',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Enter your message to continue';
                }
                return null;
              },
            ),
          ),
          const SizedBox(width: 8),
          ElevatedButton(
            onPressed: () => addMessageToGuestBook,
            child: const Row(
              children: [
                Icon(Icons.send),
                SizedBox(width: 4),
                Text('SEND'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
