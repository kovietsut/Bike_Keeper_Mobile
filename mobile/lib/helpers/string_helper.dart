import 'package:intl/intl.dart';

class StringHelper {
  static const _dateFormat = "yyyy-MM-ddThh:mm:ss";

  static String datetimeToString(DateTime dateTime) {
    return DateFormat(_dateFormat).format(dateTime);
  }

  static DateTime stringToDateTime(String val) {
    return DateTime.parse(val);
  }

  static String qualifiedString(String? val) {
    return (val == null) ? "Unknown" : val;
  }
}
