import 'package:flt_warungol_fic12/helpers/build_extension_hlp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:badges/badges.dart' as badges;

import '../../configs/x_configs.dart';
import '../../controllers/x_controllers.dart';
import '../../widgets/x_widgets.dart';
import '../x_pages.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late TextEditingController searchController;
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
    context.read<ProductBloc>().add(GetProducts());
    context.read<BestsellerProductBloc>().add(GetBestsellerProduct());
    context.read<TopratedProductBloc>().add(GetTopratedProduct());
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
        backgroundColor: context.colorSchema.background,
        title: const Text(APP_NAME),
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              'lib/assets/icons/notification.svg',
              height: 24,
            ),
          ),
          BlocBuilder<CartBloc, CartState>(
            builder: (context, state) {
              if (state is AddItemLoadedState) {
                final totalQty = state.dataOutput.fold<int>(
                    0, (previousValue, element) => previousValue + element.qty);

                return totalQty > 0
                    ? badges.Badge(
                        badgeStyle: badges.BadgeStyle(
                            badgeColor: kAppSecondary.withAlpha(150)),
                        badgeContent: Text(
                          totalQty.toString(),
                          style: TextStyle(color: kWhite),
                        ),
                        child: IconButton(
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
                      )
                    : IconButton(
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
                      );
              } else {
                return Container();
              }
            },
          ),
          SizedBox(width: 14),
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
          SizedBox(height: 5),
          const MenuCategories(),
          SizedBox(height: 22),
          BlocBuilder<ProductBloc, ProductState>(
            builder: (context, state) {
              if (state is ProductLoading) {
                return CircularProgressIndicator();
              } else if (state is ProductsLoaded) {
                return ProductList(
                  // title: 'Featured Product',
                  title: 'Main Courses',
                  onSeeAllTap: () {},
                  items: state.dataOutput.length > 2
                      ? state.dataOutput.sublist(0, 2)
                      : state.dataOutput,
                );
              } else if (state is ProductError) {
                return Center(
                  child: Text(state.error!),
                );
              } else {
                return Center(
                  child: Text('Uppss..something is wrong'),
                );
              }
            },
          ),
          // SizedBox(height: 50),
          // BannerSlider(items: banners2),
          SizedBox(height: 28),
          BlocBuilder<BestsellerProductBloc, BestsellerProductState>(
            builder: (context, state) {
              if (state is BestsellerLoadingState) {
                return CircularProgressIndicator();
              } else if (state is BestsellerLoadedState) {
                return ProductList(
                  // title: 'Best Sellers',
                  title: 'Snacks',
                  onSeeAllTap: () {},
                  items: state.dataOutput.length > 2
                      ? state.dataOutput.sublist(0, 2)
                      : state.dataOutput,
                );
              } else if (state is BestsellerErrorState) {
                return Center(
                  child: Text(state.error!),
                );
              } else {
                return Center(
                  child: Text('Uppss..something is wrong'),
                );
              }
            },
          ),
          // SizedBox(height: 50),
          // ProductList(
          //   title: 'New Arrivals',
          //   onSeeAllTap: () {},
          //   items: newArrivals,
          // ),
          SizedBox(height: 50),
          BlocBuilder<TopratedProductBloc, TopratedProductState>(
            builder: (context, state) {
              if (state is TopratedLoadingState) {
                return CircularProgressIndicator();
              } else if (state is TopratedLoadedState) {
                return ProductList(
                  // title: 'Top Rated Product',
                  title: 'Drinks',
                  onSeeAllTap: () {},
                  items: state.dataOutput.length > 2
                      ? state.dataOutput.sublist(0, 2)
                      : state.dataOutput,
                );
              } else if (state is TopratedErrorState) {
                return Center(
                  child: Text(state.error!),
                );
              } else {
                return Center(
                  child: Text('Uppss..something is wrong'),
                );
              }
            },
          ),
          // SizedBox(height: 50),
          // ProductList(
          //   title: 'Special Offers',
          //   onSeeAllTap: () {},
          //   items: specialOffers,
          // ),
        ],
      ),
    );
  }
}
