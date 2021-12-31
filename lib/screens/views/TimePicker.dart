import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/views/button_widget.dart';
import 'package:intl/intl.dart';

class TimeRangePickerWidget extends StatefulWidget {
  @override
  _TimeRangePickerWidgetState createState() => _TimeRangePickerWidgetState();
}

class _TimeRangePickerWidgetState extends State<TimeRangePickerWidget> {
  TimeOfDay _startTime;
  TimeOfDay _endTime;

  String getFrom() {
    if (_startTime == null) {
      return 'From';
    } else {
      final hours = _startTime.hour.toString().padLeft(2, '0');
      final minutes = _startTime.minute.toString().padLeft(2, '0');

      return '$hours:$minutes';
    }
  }

  String getUntil() {
    if (_endTime == null) {
      return 'Until';
    } else {
      final hours = _endTime.hour.toString().padLeft(2, '0');
      final minutes = _endTime.minute.toString().padLeft(2, '0');

      return '$hours:$minutes';
    }
  }

  @override
  Widget build(BuildContext context) => HeaderWidget(
        title: 'Time of Work',
        child: Row(
          children: [
            Expanded(
              child: ButtonWidget(
                text: getFrom(),
                onClicked: () => pickTime(context),
              ),
            ),
            const SizedBox(width: 8),
            const Icon(Icons.arrow_forward, color: Colors.white),
            const SizedBox(width: 8),
            Expanded(
              child: ButtonWidget(
                text: getUntil(),
                onClicked: () => pickTime2(context),
              ),
            ),
          ],
        ),
      );

  Future pickTime(BuildContext context) async {
    final initialTime = TimeOfDay(hour: 9, minute: 0);
    final newTime = await showTimePicker(
      context: context,
      initialTime: _startTime ?? initialTime,
    );

    if (newTime == null) return;

    setState(() => _startTime = newTime);
  }

  Future pickTime2(BuildContext context) async {
    final initialTime = TimeOfDay(hour: 23, minute: 0);
    final newTime = await showTimePicker(
      context: context,
      initialTime: _endTime ?? initialTime,
    );

    if (newTime == null) return;

    setState(() => _endTime = newTime);
  }
}
