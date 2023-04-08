import 'package:equatable/equatable.dart';
import 'package:fife/alarm/edit_alarm_sheet.dart';
import 'package:fife/common/text_writer.dart';
import 'package:fife/fife_page.dart';
import 'package:fife/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AlarmPreviewModel extends Equatable {
  const AlarmPreviewModel({
    required this.hour,
    required this.minute,
    required this.nextTrigger,
  });

  final String hour;
  final String minute;
  final String nextTrigger;
  @override
  List<Object?> get props => [
        hour,
        minute,
        nextTrigger,
      ];
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: Column(
        children: <Widget>[
          CupertinoFullscreenDialogTransition(
            primaryRouteAnimation: _animationController,
            secondaryRouteAnimation: _animationController,
            linearTransition: true,
            child: Center(
              child: Container(
                color: Colors.blueGrey,
                width: 1000,
                height: 300,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              ElevatedButton(
                onPressed: () => _animationController.forward(),
                child: Text('Forward'),
              ),
              ElevatedButton(
                onPressed: () => _animationController.reverse(),
                child: Text('Reverse'),
              ),
            ],
          ),
        ],
      ),
    ));
  }
}

class AlarmPage extends FifePage {
  const AlarmPage({super.key});

  final alarms = const [
    AlarmPreviewModel(hour: '10', minute: '15', nextTrigger: 'Tomorrow'),
    AlarmPreviewModel(hour: '10', minute: '15', nextTrigger: 'Tomorrow'),
    AlarmPreviewModel(hour: '10', minute: '15', nextTrigger: 'Tomorrow'),
    AlarmPreviewModel(hour: '10', minute: '15', nextTrigger: 'Tomorrow'),
    AlarmPreviewModel(hour: '10', minute: '15', nextTrigger: 'Friday'),
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

  final AlarmPreviewModel alarm;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextWriter(
              text: '${alarm.hour}:${alarm.minute}',
              style: FifeTheme().textScheme.xlarge,
            ),
            TextWriter(text: alarm.nextTrigger),
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
