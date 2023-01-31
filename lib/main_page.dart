import 'package:date_time_trial/zoned_date_time.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late DateTime dateTime;
  late DateTime utcDateTime;
  late DateTime jstDateTime;
  late String dateStr;
  late DateTime dateTimeFormatted;
  late DateTime utcDateTimeFormatted;
  late DateTime jstDateTimeFormatted;

  void tick() {
    dateTime = DateTime.now();
    utcDateTime = dateTime.toUtc();
    jstDateTime = dateTime.toJst();

    dateStr = '2023/02/01 00:00:00';
    dateTimeFormatted = DateFormat('yyyy/MM/dd hh:mm:ss').parse(dateStr);
    utcDateTimeFormatted = dateTimeFormatted.toUtc();
    jstDateTimeFormatted = dateTimeFormatted.toJst();
  }

  @override
  Widget build(BuildContext context) {
    tick();
    return Scaffold(
      appBar: AppBar(
        title: const Text('DateTime Trial'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Default Date Time\n$dateTime (${dateTime.timeZoneName})'),
            const SizedBox(height: 5),
            Text('UTC Date Time(diff=${dateTime.difference(utcDateTime).inHours})'),
            Text('$utcDateTime (${utcDateTime.timeZoneName})'),
            const SizedBox(height: 5),
            Text('JST Date Time\n$jstDateTime'),
            const SizedBox(height: 10),
            Text('Format Target Date Time\n$dateStr'),
            const SizedBox(height: 5),
            Text('Default Date Time\n$dateTimeFormatted (${dateTimeFormatted.timeZoneName})'),
            const SizedBox(height: 5),
            Text('UTC Date Time\n$utcDateTimeFormatted (${utcDateTimeFormatted.timeZoneName})'),
            const SizedBox(height: 5),
            Text('JST Date Time\n$jstDateTimeFormatted'),
          ],
        ),
      ),
    );
  }
}
