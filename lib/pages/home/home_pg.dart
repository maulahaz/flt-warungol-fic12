import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../models/x_models.dart';
import '../../widgets/x_widgets.dart';
import 'x_homes.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late TextEditingController searchController;
  final List<ProductModel> featuredProducts = [
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
  final List<ProductModel> bestSellers = [
    ProductModel(
      images: [
        'lib/assets/images/products/keyboard.png',
        'lib/assets/images/products/keyboard.png',
        'lib/assets/images/products/keyboard.png',
      ],
      name: 'Keyboard Mechanical',
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
    ProductModel(
      images: [
        'lib/assets/images/products/mac.png',
        'lib/assets/images/products/mac.png',
        'lib/assets/images/products/mac.png',
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
  final List<ProductModel> newArrivals = [
    ProductModel(
      images: [
        'lib/assets/images/products/sepatu.png',
        'lib/assets/images/products/sepatu.png',
        'lib/assets/images/products/sepatu.png',
      ],
      name: 'Sepatu Nike',
      price: 2200000,
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
        'lib/assets/images/products/sepatu2.png',
        'lib/assets/images/products/sepatu2.png',
        'lib/assets/images/products/sepatu2.png',
      ],
      name: 'Sepatu Nike',
      price: 2200000,
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
  final List<ProductModel> topRatedProducts = [
    ProductModel(
      images: [
        'lib/assets/images/products/mac2.png',
        'lib/assets/images/products/mac2.png',
        'lib/assets/images/products/mac2.png',
      ],
      name: 'Macbook',
      price: 12220000,
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
        'lib/assets/images/products/mac.png',
        'lib/assets/images/products/mac.png',
        'lib/assets/images/products/mac.png',
      ],
      name: 'Macbook',
      price: 12220000,
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
  final List<ProductModel> specialOffers = [
    ProductModel(
      images: [
        'lib/assets/images/products/lampu.png',
        'lib/assets/images/products/lampu.png',
        'lib/assets/images/products/lampu.png',
      ],
      name: 'Macbook',
      price: 12220000,
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
        'lib/assets/images/products/keyboard.png',
        'lib/assets/images/products/keyboard.png',
        'lib/assets/images/products/keyboard.png',
      ],
      name: 'Macbook',
      price: 12220000,
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
  final List<String> banners1 = [
    'lib/assets/images/banner1.png',
    'lib/assets/images/banner1.png',
  ];
  final List<String> banners2 = [
    'lib/assets/images/banner2.png',
    'lib/assets/images/banner2.png',
  ];

  @override
  void initState() {
    searchController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MHz Store'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              'lib/assets/icons/notification.svg',
              height: 24,
            ),
          ),
          IconButton(
            onPressed: () {
              context.goNamed(
                'cart',
                // pathParameters: PathParameters().toMap(),
              );
            },
            icon: SvgPicture.asset(
              'lib/assets/icons/cart.svg',
              height: 24,
            ),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          SearchInput(
            controller: searchController,
            onTap: () {
              context.pushReplacementNamed(
                'root',
                // pathParameters: PathParameters(
                //   rootTab: RootTab.explore,
                // ).toMap(),
              );
            },
          ),
          SizedBox(height: 16),
          BannerSlider(items: banners1),
          SizedBox(height: 22),
          TitleContent(
            title: 'Categories',
            onSeeAllTap: () {},
          ),
          SizedBox(height: 12),
          const MenuCategories(),
          SizedBox(height: 50),
          ProductList(
            title: 'Featured Product',
            onSeeAllTap: () {},
            items: featuredProducts,
          ),
          SizedBox(height: 50),
          BannerSlider(items: banners2),
          SizedBox(height: 28),
          ProductList(
            title: 'Best Sellers',
            onSeeAllTap: () {},
            items: bestSellers,
          ),
          SizedBox(height: 50),
          ProductList(
            title: 'New Arrivals',
            onSeeAllTap: () {},
            items: newArrivals,
          ),
          SizedBox(height: 50),
          ProductList(
            title: 'Top Rated Product',
            onSeeAllTap: () {},
            items: topRatedProducts,
          ),
          SizedBox(height: 50),
          ProductList(
            title: 'Special Offers',
            onSeeAllTap: () {},
            items: specialOffers,
          ),
        ],
      ),
    );
  }
}
