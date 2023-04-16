import 'package:fife/flows/alarm/api/models.dart';
import 'package:fife/flows/alarm/ui/edit_alarm_sheet.dart';
import 'package:fife/ui/common/text_writer.dart';
import 'package:fife/fife_page.dart';
import 'package:fife/style.dart';
import 'package:flutter/material.dart';

class AlarmPage extends FifePage {
  AlarmPage({super.key});

  final alarms = [
    AlarmModel(
      time: DateTime.now(),
      schedule: const Schedule(),
      music: const Music(
        provider: StreamingService.spotify,
        artist: 'Russ',
        title: 'Pull the Trigger',
        duration: TimeDuration(start: 0, end: 100),
      ),
    ),
    AlarmModel(
      time: DateTime.now(),
      schedule: const Schedule(),
      music: const Music(
        provider: StreamingService.spotify,
        artist: 'Russ',
        title: 'Pull the Trigger',
        duration: TimeDuration(start: 0, end: 100),
      ),
    ),
  ];

  @override
  Widget content(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextWriter(
          text: "Alarm",
          style: FifeTheme().textScheme.large,
        ),
        Expanded(
          child: ListView.separated(
            itemCount: alarms.length,
            itemBuilder: (c, i) {
              return _AlarmPreview(alarms[i]);
            },
            separatorBuilder: (c, i) {
              return Divider(color: FifeTheme().colorScheme.grey);
            },
          ),
        ),
      ],
    );
  }
}

class _AlarmPreview extends StatelessWidget {
  const _AlarmPreview(this.alarm);

  final AlarmModel alarm;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextWriter(
              text: TimeHelper.prettify(alarm.time, false),
              style: FifeTheme().textScheme.xlarge,
            ),
          ],
        ),
        ElevatedButton(
          onPressed: () {
            Scaffold.of(context).showBottomSheet(
              backgroundColor: Colors.transparent,
              (context) {
                return const EditAlarmSheet();
              },
            );
          },
          child: const Text(
            'Edit',
          ),
        ),
      ],
    );
  }
}

class TimeHelper {
  static String prettify(DateTime time, bool militaryTime) {
    String hour;
    String minute = time.minute.toString();
    bool isAm = time.hour <= 12;
    if (militaryTime || isAm) {
      hour = time.hour.toString();
    } else {
      hour = (time.hour - 12).toString();
    }
    return '$hour:$minute${militaryTime ? '' : isAm ? ' AM' : ' PM'}';
  }
}
