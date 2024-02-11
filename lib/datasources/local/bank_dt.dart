import '../../models/x_models.dart';

final banks = [
  BankAccountModel(
      code: 'bri',
      name: 'BRI Virtual Account',
      image: 'lib/assets/images/BRI Direct Debit.png',
      method: 'bank_transfer'),
  BankAccountModel(
      code: 'bca',
      name: 'BCA Virtual Account',
      image: 'lib/assets/images/BCA.png',
      method: 'bank_transfer'),
  BankAccountModel(
      code: 'mandiri',
      name: 'Bank Mandiri',
      image: 'lib/assets/images/Mandiri.png',
      method: 'bank_transfer'),
];
