import 'package:mobile/global/theme.dart';
import 'schedule_listview_row.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:intl/intl.dart';

class ScheduleContent extends StatefulWidget {
  final double height;

  const ScheduleContent({Key? key, required this.height}) : super(key: key);

  @override
  _ScheduleContentState createState() => _ScheduleContentState();
}

class _ScheduleContentState extends State<ScheduleContent> {
  // ignore: unused_field
  late String _selectedDate;
  // ignore: unused_field
  late String _dateCount;
  // ignore: unused_field
  late String _range;
  // ignore: unused_field
  late String _rangeCount;

  @override
  void initState() {
    _selectedDate = '';
    _dateCount = '';
    _range = '';
    _rangeCount = '';
    super.initState();
  }

  void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    setState(() {
      if (args.value is PickerDateRange) {
        _range =
            DateFormat('yyyy-MM-dd').format(args.value.startDate).toString() +
                ' - ' +
                DateFormat('yyyy-MM-dd')
                    .format(args.value.endDate ?? args.value.startDate)
                    .toString();
      } else if (args.value is DateTime) {
        _selectedDate = args.value;
      } else if (args.value is List<DateTime>) {
        _dateCount = args.value.length.toString();
      } else {
        _rangeCount = args.value.length.toString();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var fromDate = "2020-07-20 20:00:00";
    var toDate = "2020-07-20 23:59:59";
    return SizedBox(
      height: widget.height,
      child: Column(
        children: [
          Expanded(
            flex: 5,
            child: Container(
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border:
                    Border.all(width: 2, color: ASCENT_BLUE.withOpacity(0.9)),
              ),
              child: SfDateRangePicker(
                startRangeSelectionColor: ASCENT_BLUE,
                rangeSelectionColor: ASCENT_BLUE.withOpacity(0.3),
                endRangeSelectionColor: ASCENT_BLUE,
                view: DateRangePickerView.month,
                onSelectionChanged: _onSelectionChanged,
                selectionColor: ASCENT_BLUE,
                todayHighlightColor: ASCENT_BLUE,
                yearCellStyle: const DateRangePickerYearCellStyle(
                  todayTextStyle: TextStyle(color: ASCENT_BLUE),
                ),
                monthCellStyle: const DateRangePickerMonthCellStyle(
                  todayTextStyle: TextStyle(color: ASCENT_BLUE),
                ),
                selectionMode: DateRangePickerSelectionMode.range,
                initialSelectedRange: PickerDateRange(
                    DateTime.now().subtract(const Duration(days: 4)),
                    DateTime.now().add(const Duration(days: 3))),
              ),
            ),
          ),
          Expanded(
            flex: 9,
            child: ListView.builder(
              itemCount: 30,
              itemBuilder: (context, index) {
                return ScheduleListViewRow(
                  title: "Hello World " + (index + 1).toString(),
                  fromTime: "begin: " + fromDate,
                  toTime: "end: " + toDate,
                  color: (index % 2 == 0) ? ASCENT_BLUE : PRIME_WHITE,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
