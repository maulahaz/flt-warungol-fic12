import 'package:flt_warungol_fic12/helpers/x_helpers.dart';

class TransactionModel {
  final String noResi;
  final String status;
  final int quantity;
  final int price;

  TransactionModel({
    required this.noResi,
    required this.status,
    required this.quantity,
    required this.price,
  });

  String get item => '$quantity item yang dibeli';
  String get priceFormat => price.currencyFormatRp;
}

final List<TransactionModel> transactions = [
  TransactionModel(
    noResi: 'QQNSU346JK',
    status: 'Dikirim',
    quantity: 2,
    price: 1900000,
  ),
  TransactionModel(
    noResi: 'SDG1345KJD',
    status: 'Sukses',
    quantity: 2,
    price: 900000,
  ),
];
