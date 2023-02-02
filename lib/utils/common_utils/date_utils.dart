import 'package:intl/intl.dart';

class DateFunctions {
  static String getFormattedDate({
    required DateTime? date,
  }) {
    try {
      DateFormat formatter = DateFormat('yyyy-MM-dd h:mm a');
      String formattedDate = formatter.format(date!);
      return formattedDate;
    } catch (e) {
      return " ";
    }
  }

  static String getFormattedDateFromString({String? date}) {
    return "";
  }

  // TODO:Add More [Date] related functions here
}
