import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(RemindersApp());
}

class RemindersApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: RemindersScreen(),
      theme: ThemeData.dark(),
    );
  }
}

class RemindersScreen extends StatefulWidget {
  @override
  _RemindersScreenState createState() => _RemindersScreenState();
}

class _RemindersScreenState extends State<RemindersScreen> {
  final List<Map<String, dynamic>> _reminders = [
    {
      'text': 'Go for a run',
      'dateTime': DateTime.now().add(Duration(hours: 1)),
      'completed': false,
    },
    {
      'text': 'Buy groceries',
      'dateTime': DateTime.now().add(Duration(days: 1)),
      'completed': true,
    },
    {
      'text': 'Doctor appointment',
      'dateTime': DateTime.now().add(Duration(days: 2, hours: 2)),
      'completed': false,
    },
  ];
  final TextEditingController _controller = TextEditingController();

  void _addReminder(String text, DateTime? dateTime) {
    if (text.isNotEmpty && dateTime != null) {
      setState(() {
        _reminders.add({
          'text': text,
          'dateTime': dateTime,
          'completed': false,
        });
      });
      _controller.clear();
    }
  }

  Future<DateTime?> _pickDateTime(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );

      if (pickedTime != null) {
        return DateTime(
          pickedDate.year,
          pickedDate.month,
          pickedDate.day,
          pickedTime.hour,
          pickedTime.minute,
        );
      }
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reminders'),
      ),
      body: ListView.builder(
        itemCount: _reminders.length,
        itemBuilder: (context, index) {
          final reminder = _reminders[index];
          final formattedDate = DateFormat('yyyy-MM-dd – kk:mm')
              .format(reminder['dateTime']);
          return ListTile(
            title: Text(
              reminder['text'],
              style: TextStyle(
                decoration: reminder['completed']
                    ? TextDecoration.lineThrough
                    : TextDecoration.none,
              ),
            ),
            subtitle: Text(formattedDate),
            trailing: Checkbox(
              value: reminder['completed'],
              onChanged: (value) {
                setState(() {
                  reminder['completed'] = value!;
                });
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          DateTime? pickedDateTime = await _pickDateTime(context);
          if (pickedDateTime != null) {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text('Add Reminder'),
                  content: TextField(
                    controller: _controller,
                    decoration: InputDecoration(hintText: 'Enter reminder'),
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        _addReminder(_controller.text, pickedDateTime);
                        Navigator.of(context).pop();
                      },
                      child: Text('Add'),
                    ),
                  ],
                );
              },
            );
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
