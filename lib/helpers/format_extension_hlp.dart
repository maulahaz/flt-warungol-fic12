import 'package:intl/intl.dart';

extension IntegerExt on int {
  String get currencyFormatRp => NumberFormat.currency(
        locale: 'id',
        symbol: 'IDR ',
        decimalDigits: 0,
      ).format(this);
}

extension Capitalized on String {
  String capitalized() =>
      this.substring(0, 1).toUpperCase() + this.substring(1).toLowerCase();
}
