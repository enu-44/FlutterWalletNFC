import 'package:intl/intl.dart';

class DateFormatUtils {
  const DateFormatUtils._();

  static DateTime? fromJsonDateTime(String? date) =>
      date != null ? DateTime.parse(date) : null;

  static String? toStringTimeStamp(DateTime? date) => date != null
      ? "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}T${date.hour.toString().padLeft(2, '0')}:${date.minute.toString().padLeft(2, '0')}:${date.second.toString().padLeft(2, '0')}Z"
      : null;

  static String? convertToDDMMAAAAHHMM12(DateTime? dateTime,
      {String separator = '-'}) {
    if (dateTime != null) {
      final String timeFormat = DateFormat('hh:mm a').format(dateTime);
      return "${dateTime.day.toString().padLeft(2, '0')}$separator${dateTime.month.toString().padLeft(2, '0')}$separator${dateTime.year.toString().padLeft(4, '0')} $timeFormat";
    }
    return null;
  }

  static String convertToDateHour(DateTime date) {
    final formatter = DateFormat('dd MMMM yyyy \'a las\' hh:mm a', 'es_ES');
    return formatter.format(date);
  }

  static String convertToTimeLine(DateTime? date) {
    if (date == null) return '';
    final now = DateTime.now();
    final difference = now.difference(date);
    if (difference.inSeconds < 60) {
      return 'Hace un momento';
    } else if (difference.inMinutes < 60) {
      return 'Hace ${difference.inMinutes} minutos';
    } else if (difference.inHours < 24 && now.day == date.day) {
      return 'Hace ${difference.inHours} horas';
    } else if (now.day - 1 == date.day &&
        now.month == date.month &&
        now.year == date.year) {
      final formatter = DateFormat('hh:mm a'); // Formato de hora
      return 'Ayer a las ${formatter.format(date)}';
    } else {
      final formatter = DateFormat('dd MMMM yyyy');
      return formatter.format(date);
    }
  }
}
