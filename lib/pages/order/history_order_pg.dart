import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../controllers/x_controllers.dart';
import 'parts/order_card.dart';

class HistoryOrderPage extends StatefulWidget {
  const HistoryOrderPage({super.key});

  @override
  State<HistoryOrderPage> createState() => _HistoryOrderPageState();
}

class _HistoryOrderPageState extends State<HistoryOrderPage> {
  @override
  void initState() {
    context.read<HistoryOrderBloc>().add(GetHistoryOrder());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order History'),
      ),
      body: BlocBuilder<HistoryOrderBloc, HistoryOrderState>(
        builder: (context, state) {
          if (state is GetHistoryOrderLoadedState) {
            final dtHistoryOrder = state.dataHistoryOrder;
            if (dtHistoryOrder.data!.isEmpty) {
              return const Center(
                child: Text('No Data'),
              );
            }
            return ListView.separated(
              padding: const EdgeInsets.all(16.0),
              separatorBuilder: (context, index) =>
                  const SizedBox(height: 16.0),
              itemCount: dtHistoryOrder.data!.length,
              itemBuilder: (context, index) => OrderCard(
                data: dtHistoryOrder.data![index],
              ),
            );
          }
          if (state is GetHistoryOrderLoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return const Center(
              child: Text('No Data'),
            );
          }
        },
      ),
    );
  }
}
