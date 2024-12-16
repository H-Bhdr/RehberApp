  import 'package:intl/intl.dart';

String formatDate(String? date) {
    if (date == null) return 'Unknown Date';
    final parsedDate = DateTime.parse(date);
    return DateFormat('dd MMMM', 'tr').format(parsedDate); // Format date in Turkish
  }
