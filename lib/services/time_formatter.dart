import 'package:intl/intl.dart';

extension TimeFormatter on DateTime {
  String format() {
    try {
      return DateFormat("dd.mm.yyyy hh:mm:ss").format(this);
    } catch (e) {
      return "";
    }
  }
}
