import 'package:intl/intl.dart';

extension TimeFormatter on DateTime {
  String format() {
    try {
      return DateFormat("HH:mm:ss").format(this);
    } catch (e) {
      return "";
    }
  }
}
