import 'package:fife/alarm/alarm_page.dart';
import 'package:fife/style.dart';
import 'package:flutter/cupertino.dart';

class EditAlarmSheet extends StatelessWidget {
  const EditAlarmSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: FifeTheme().colorScheme.grey),
      height: MediaQuery.of(context).size.height * 0.9,
      child: Column(
        children: [
          Padding(
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
          ),
        ],
      ),
    );
  }
}
