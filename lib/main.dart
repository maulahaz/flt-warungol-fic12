import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'configs/x_configs.dart';
import 'controllers/x_controllers.dart';
import 'router/app_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = AppRouter();
    final router = appRouter.router;
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CategoryBloc()),
        BlocProvider(create: (context) => WarungBloc()),
        BlocProvider(create: (context) => ProductBloc()),
        BlocProvider(create: (context) => BestsellerProductBloc()),
        BlocProvider(create: (context) => TopratedProductBloc()),
        BlocProvider(create: (context) => CartBloc()),
        BlocProvider(create: (context) => AuthBloc()),
        BlocProvider(create: (context) => AddressBloc()),
        BlocProvider(create: (context) => AddressCubit()),
        BlocProvider(create: (context) => ProvinceBloc()),
        BlocProvider(create: (context) => CityBloc()),
        BlocProvider(create: (context) => SubdistrictBloc()),
        BlocProvider(create: (context) => ShippingCostBloc()),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: Themes.light,
        routerDelegate: router.routerDelegate,
        routeInformationParser: router.routeInformationParser,
        routeInformationProvider: router.routeInformationProvider,
      ),
    );
  }
}
