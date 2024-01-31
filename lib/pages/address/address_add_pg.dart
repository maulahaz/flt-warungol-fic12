import 'package:flt_warungol_fic12/controllers/x_controllers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../models/x_models.dart';
import '../../widgets/x_widgets.dart';

class AddressAddPage extends StatelessWidget {
  const AddressAddPage({super.key});

  @override
  Widget build(BuildContext context) {
    final country = ['Indonesia', 'Inggris', 'Spanyol'];
    final countryNotifier = ValueNotifier(country.first);
    final firstNameController = TextEditingController();
    final lastNameController = TextEditingController();
    final addressController = TextEditingController();
    final cityController = TextEditingController();
    final provinceController = TextEditingController();
    final zipCodeController = TextEditingController();
    final phoneNumberController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Adress'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20.0),
        children: [
          ValueListenableBuilder(
            valueListenable: countryNotifier,
            builder: (context, value, _) => CustomDropdown(
              value: value,
              items: country,
              label: 'Country or Region',
              onChanged: (value) => countryNotifier.value = value ?? '',
            ),
          ),
          const SizedBox(height: 24.0),
          CustomTextField(
            controller: firstNameController,
            label: 'First Name',
          ),
          const SizedBox(height: 24.0),
          CustomTextField(
            controller: lastNameController,
            label: 'Last Name',
          ),
          const SizedBox(height: 24.0),
          CustomTextField(
            controller: addressController,
            label: 'St. Address',
          ),
          const SizedBox(height: 24.0),
          CustomTextField(
            controller: cityController,
            label: 'City',
          ),
          const SizedBox(height: 24.0),
          CustomTextField(
            controller: provinceController,
            label: 'Province',
          ),
          const SizedBox(height: 24.0),
          CustomTextField(
            controller: zipCodeController,
            label: 'Post Code',
          ),
          const SizedBox(height: 24.0),
          CustomTextField(
            controller: phoneNumberController,
            label: 'Phone Number',
          ),
          const SizedBox(height: 24.0),
          MyButtons.primary(context, 'Save', () {
            context.pop();
            context.read<AddressBloc>().add(AddAddress(
                  Address(
                    name: firstNameController.text,
                    address: addressController.text,
                    phone: phoneNumberController.text,
                    cityId: cityController.text,
                    provinceId: provinceController.text,
                    // districtId: distr.text,
                    postalCode: zipCodeController.text,
                    userId: 2,
                    isDefault: 0,
                  ),
                ));
          })
        ],
      ),
    );
  }
}
