import 'package:fife/common/clickable_widget.dart';
import 'package:fife/common/spacing.dart';
import 'package:fife/common/text_writer.dart';
import 'package:fife/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EditAlarmSheet extends StatelessWidget {
  const EditAlarmSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: FifeTheme().colorScheme.grey),
      height: MediaQuery.of(context).size.height * 0.9,
      child: Column(
        children: Spacing.spaceBetween([
          _header(context),
          _daysActive,
          _editDetails,
        ], 20),
      ),
    );
  }

  Widget _header(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          Expanded(
            child: ClickableWidget(
              onTap: () => Navigator.pop(context),
              child: TextWriter(
                text: 'Cancel',
                style: FifeTheme()
                    .textScheme
                    .normal
                    .copyWith(newColor: FifeTheme().colorScheme.gold),
              ),
            ),
          ),
          Expanded(
            child: TextWriter(
              text: 'Details',
              style: FifeTheme()
                  .textScheme
                  .medium
                  .copyWith(newWeight: TextStyleWeight.semiBold),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            child: TextWriter(
              text: 'Save',
              textAlign: TextAlign.end,
              style: FifeTheme().textScheme.normal.copyWith(
                    newColor: FifeTheme().colorScheme.gold,
                    newWeight: TextStyleWeight.semiBold,
                  ),
            ),
          ),
        ],
      ),
    );
  }

  Widget get _daysActive {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: Spacing.spaceBetween([
        TextWriter(
          text: 'Days Active',
          style: FifeTheme().textScheme.large,
        ),
        Container(
          width: 350,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: FifeTheme().colorScheme.background,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [
              DaySelector(day: 'S'),
              DaySelector(day: 'M'),
              DaySelector(day: 'T'),
              DaySelector(day: 'W'),
              DaySelector(day: 'T'),
              DaySelector(day: 'F'),
              DaySelector(day: 'S'),
            ],
          ),
        ),
      ], 10),
    );
  }

  Widget get _editDetails {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: Spacing.spaceBetween([
        TextWriter(
          text: 'Time',
          style: FifeTheme().textScheme.large,
        ),
        Container(
          width: 350,
          height: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: FifeTheme().colorScheme.background,
          ),
          child: CupertinoDatePicker(
            onDateTimeChanged: (_) {},
            mode: CupertinoDatePickerMode.time,
          ),
        ),
      ], 10),
    );
  }
}

class DaySelector extends StatefulWidget {
  const DaySelector({required this.day, super.key});

  final String day;

  @override
  State<StatefulWidget> createState() => _DaySelectorState();
}

class _DaySelectorState extends State<DaySelector> {
  bool _active = false;
  Color? _selectedColor;

  @override
  Widget build(BuildContext context) {
    return ClickableWidget(
      onTap: () => setState(
        () {
          _active = !_active;
          if (_active) {
            _selectedColor = FifeTheme().colorScheme.blue;
          } else {
            _selectedColor = null;
          }
        },
      ),
      child: AnimatedContainer(
        height: 30,
        width: 30,
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: _selectedColor,
            border: Border.all(
              color: FifeTheme().colorScheme.blue,
              width: 2.0,
            )),
        child: Center(
          child: TextWriter(
            text: widget.day,
            style: FifeTheme().textScheme.small,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
