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
