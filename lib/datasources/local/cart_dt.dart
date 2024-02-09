import '../../models/x_models.dart';

final List<ProductModel> dataCarts = [
  ProductModel(
    images: [
      'lib/assets/images/products/lampu.png',
      'lib/assets/images/products/lampu.png',
      'lib/assets/images/products/lampu.png',
    ],
    name: 'Lampu',
    price: 90000,
    stock: 20,
    description:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. ',
    store: StoreModel(
      name: 'CWB Online Store',
      type: StoreEnum.officialStore,
      imageUrl: 'https://avatars.githubusercontent.com/u/534678?v=4',
    ),
  ),
  ProductModel(
    images: [
      'lib/assets/images/products/earphone.png',
      'lib/assets/images/products/earphone.png',
      'lib/assets/images/products/earphone.png',
    ],
    name: 'Earphone',
    price: 320000,
    stock: 20,
    description:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. ',
    store: StoreModel(
      name: 'CWB Online Store',
      type: StoreEnum.officialStore,
      imageUrl: 'https://avatars.githubusercontent.com/u/534678?v=4',
    ),
  ),
];
