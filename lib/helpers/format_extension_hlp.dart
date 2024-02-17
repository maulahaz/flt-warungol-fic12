import 'package:intl/intl.dart';

//--INTEGER (CURRENCY):
extension IntegerExt on int {
  String get currencyFormatRp => NumberFormat.currency(
        locale: 'id',
        symbol: 'IDR ',
        decimalDigits: 0,
      ).format(this);
}

//--STRING (CAPITALIZE & TitleCase):
extension StringExt on String {
  String capitalized() =>
      this.substring(0, 1).toUpperCase() + this.substring(1).toLowerCase();

  String toTitleCase() => replaceAll(RegExp(' +'), ' ')
      .split(' ')
      .map((str) => str.capitalized())
      .join(' ');
}

//--DATETIME:
extension DateTimeExt on DateTime {
  String toFormattedDate() {
    const List<String> monthNames = [
      'Januari',
      'Februari',
      'Maret',
      'April',
      'Mei',
      'Juni',
      'Juli',
      'Agustus',
      'September',
      'Oktober',
      'November',
      'Desember'
    ];

    String day = this.day.toString();
    String month = monthNames[this.month - 1];
    String year = this.year.toString();

    return '$day $month $year';
  }
}
