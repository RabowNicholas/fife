import 'package:fife/service/models.dart';
import 'package:fife/service/service.dart';
import 'package:fife/ui/alarm/edit_alarm_sheet.dart';
import 'package:fife/ui/common/text_writer.dart';
import 'package:fife/fife_page.dart';
import 'package:fife/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class AlarmPage extends FifePage {
  const AlarmPage({super.key});

  @override
  Widget content(BuildContext context) {
    return const AlarmRootWidget();
  }
}

class AlarmRootWidget extends StatefulWidget {
  const AlarmRootWidget({super.key});

  @override
  State<StatefulWidget> createState() => _AlarmRootWidgetState();
}

class _AlarmRootWidgetState extends State<AlarmRootWidget> {
  bool _initialized = false;
  List<AlarmModel>? _alarms;

  @override
  void initState() {
    final service = GetIt.I.get<FifeService>();
    service.fetchAlarms('userId').then((alarms) => setState(() {
          _alarms = alarms;
          _initialized = true;
        }));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (!_initialized) {
      return const CupertinoActivityIndicator();
    } else {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextWriter(
            text: "Alarm",
            style: FifeTheme().textScheme.large,
          ),
          Expanded(
            child: ListView.separated(
              itemCount: _alarms!.length,
              itemBuilder: (c, i) {
                return _AlarmPreview(_alarms![i]);
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
