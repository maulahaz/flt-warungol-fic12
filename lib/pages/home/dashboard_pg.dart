import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../configs/x_configs.dart';
import 'x_homes.dart';

class DashboardPage extends StatefulWidget {
  final int currentTab;
  const DashboardPage({
    Key? key,
    required this.currentTab,
  }) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  late int _selectedIndex;
  final List<Widget> _pages = [
    const HomePage(),
    // const SearchPage(),
    // const CartPage(),
    // const Center(
    //   child: Text('This Page 1'),
    // ),
    const Center(
      child: Text('This Page 2'),
    ),
    const Center(
      child: Text('This Page 3'),
    ),
    const Center(
      child: Text('This Page 4 '),
    ),
  ];

  void _onItemTapped(int index) {
    _selectedIndex = index;
    setState(() {});
  }

  @override
  void initState() {
    _selectedIndex = widget.currentTab;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _selectedIndex, children: _pages),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        selectedItemColor: kAppPrimary,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'lib/assets/icons/home.svg',
              colorFilter: const ColorFilter.mode(
                kAppGrey,
                BlendMode.srcIn,
              ),
            ),
            activeIcon: SvgPicture.asset('lib/assets/icons/home.svg'),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('lib/assets/icons/search.svg',
                colorFilter: const ColorFilter.mode(
                  kAppGrey,
                  BlendMode.srcIn,
                )),
            activeIcon: SvgPicture.asset('lib/assets/icons/search.svg'),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('lib/assets/icons/order.svg',
                colorFilter: const ColorFilter.mode(
                  kAppGrey,
                  BlendMode.srcIn,
                )),
            activeIcon: SvgPicture.asset('lib/assets/icons/order.svg'),
            label: 'Order',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('lib/assets/icons/person.svg',
                colorFilter: const ColorFilter.mode(
                  kAppGrey,
                  BlendMode.srcIn,
                )),
            activeIcon: SvgPicture.asset('lib/assets/icons/person.svg'),
            label: 'User',
          ),
        ],
      ),
    );
  }
}
