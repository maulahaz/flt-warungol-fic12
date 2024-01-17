import 'package:flt_warungol_fic12/controllers/x_controllers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../widgets/x_widgets.dart';

class MenuCategories extends StatefulWidget {
  const MenuCategories({super.key});

  @override
  State<MenuCategories> createState() => _MenuCategoriesState();
}

class _MenuCategoriesState extends State<MenuCategories> {
  @override
  void initState() {
    super.initState();
    context.read<CategoryBloc>().add(GetCategories());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryBloc, CategoryState>(
      builder: (context, state) {
        if (state is CategoryLoaded) {
          return Row(
            children: [
              ...state.dataOutput.data!.map(
                (e) => Flexible(
                  child: CategoryButton(
                    imagePath: e.picture!,
                    label: e.name!,
                    onPressed: () {},
                  ),
                ),
              )
            ],
          );
        } else {
          return Container();
        }
        // return Row(
        //   crossAxisAlignment: CrossAxisAlignment.start,
        //   children: [
        //     Flexible(
        //       child: CategoryButton(
        //         imagePath: 'lib/assets/images/categories/menu-bestseller.png',
        //         label: 'Best Seller',
        //         onPressed: () {},
        //       ),
        //     ),
        //     Flexible(
        //       child: CategoryButton(
        //         imagePath: 'lib/assets/images/categories/menu-flashsale.png',
        //         label: 'Flash Sale',
        //         onPressed: () {},
        //       ),
        //     ),
        //     Flexible(
        //       child: CategoryButton(
        //         imagePath: 'lib/assets/images/categories/menu-toprated.png',
        //         label: 'Top Rated',
        //         onPressed: () {},
        //       ),
        //     ),
        //     Flexible(
        //       child: CategoryButton(
        //         imagePath: 'lib/assets/images/categories/menu-more.png',
        //         label: 'More',
        //         onPressed: () {},
        //       ),
        //     ),
        //   ],
        // );
      },
    );
  }
}
