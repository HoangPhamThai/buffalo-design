import 'package:intl/intl.dart';

tryCatch(Function func) {
  try {
    return func();
  } catch (e, stackTrace) {
    print(e);
    print(stackTrace);
    throw Exception(e);
  }
}

String formatDateTime({required DateTime date, required String format}) {
  return tryCatch(() {
    return DateFormat(format).format(date);
  });
}

int getColorIndex(String? value) {
  value ??= '';
  return value.length < 17 ? value.length : 17;
}

String getShortName(String? name) {
  if ((name ?? '').trim().isEmpty) return '';
  var segments = name!.split(' ');
  if (segments.length > 1) {
    return ('${segments[0][0]}${segments[segments.length - 1][0]}').toUpperCase();
  }
  return segments[0][0].toUpperCase();
}
