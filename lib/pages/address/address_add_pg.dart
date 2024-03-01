import 'package:flt_warungol_fic12/controllers/x_controllers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../models/x_models.dart';
import '../../widgets/x_widgets.dart';

class AddressAddPage extends StatefulWidget {
  const AddressAddPage({super.key});

  @override
  State<AddressAddPage> createState() => _AddressAddPageState();
}

class _AddressAddPageState extends State<AddressAddPage> {
  // final country = ['Indonesia', 'UAE', 'KSA','Qatar','Oman'];
  // final countryNotifier = ValueNotifier(country.first);
  // final lastNameController = TextEditingController();
  final nameController = TextEditingController();
  final addressController = TextEditingController();
  final cityController = TextEditingController();
  final provinceController = TextEditingController();
  final postalCodeController = TextEditingController();
  final phoneNumberController = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<ProvinceBloc>().add(GetProvinces());
  }

  Province selectedProvince = Province(province: '', provinceId: '');
  City selectedCity = City(cityId: '');
  Subdistrict selectedSubdistrict = Subdistrict(subdistrictId: '');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Address'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20.0),
        children: [
          // ValueListenableBuilder(
          //   valueListenable: countryNotifier,
          //   builder: (context, value, _) => CustomDropdown(
          //     value: value,
          //     items: country,
          //     label: 'Country or Region',
          //     onChanged: (value) => countryNotifier.value = value ?? '',
          //   ),
          // ),
          // const SizedBox(height: 24.0),
          CustomTextField(
            controller: nameController,
            label: 'Name',
          ),
          const SizedBox(height: 24.0),
          CustomTextField(
            controller: addressController,
            label: 'Address',
          ),
          const SizedBox(height: 24.0),
          BlocBuilder<ProvinceBloc, ProvinceState>(
            builder: (context, state) {
              if (state is GetProvinceLoadedState) {
                selectedProvince = state.provinces.first;
                return CustomDropdown<Province>(
                  value: selectedProvince,
                  items: state.provinces,
                  label: 'Province',
                  onChanged: (val) {
                    setState(() {
                      selectedProvince = val!;
                      context.read<CityBloc>().add(
                          GetCityByProvinceId(selectedProvince.provinceId!));
                    });
                  },
                );
              } else if (state is GetProvinceLoadingState) {
                return Center(child: CircularProgressIndicator());
              } else {
                return Container();
              }
            },
          ),
          const SizedBox(height: 24.0),
          BlocBuilder<CityBloc, CityState>(
            builder: (context, state) {
              if (state is GetCityLoadedState) {
                selectedCity = state.cities.first;
                return CustomDropdown<City>(
                  value: selectedCity,
                  items: state.cities,
                  label: 'City',
                  onChanged: (val) {
                    setState(() {
                      selectedCity = val!;
                      context
                          .read<SubdistrictBloc>()
                          .add(GetSubdistrictByCityId(selectedCity.cityId!));
                    });
                  },
                );
              } else if (state is GetCityLoadingState) {
                return Center(child: CircularProgressIndicator());
              } else {
                return CustomDropdown(
                  value: '-',
                  items: ['-'],
                  label: 'City',
                  onChanged: (val) {},
                );
              }
            },
          ),
          const SizedBox(height: 24.0),
          BlocBuilder<SubdistrictBloc, SubdistrictState>(
            builder: (context, state) {
              if (state is GetSubdistrictLoadedState) {
                selectedSubdistrict = state.subdistricts.first;
                return CustomDropdown<Subdistrict>(
                  value: selectedSubdistrict,
                  items: state.subdistricts,
                  label: 'Subdistrict',
                  onChanged: (val) {
                    setState(() {
                      selectedSubdistrict = val!;
                    });
                  },
                );
              } else if (state is GetSubdistrictLoadingState) {
                return Center(child: CircularProgressIndicator());
              } else {
                return CustomDropdown(
                  value: '-',
                  items: ['-'],
                  label: 'Subdistrict',
                  onChanged: (val) {},
                );
              }
            },
          ),
          const SizedBox(height: 24.0),
          CustomTextField(
            controller: postalCodeController,
            label: 'Post Code',
          ),
          const SizedBox(height: 24.0),
          CustomTextField(
            controller: phoneNumberController,
            label: 'Phone Number',
          ),
          const SizedBox(height: 24.0),
          BlocConsumer<AddressBloc, AddressState>(
            listener: (context, state) {
              if (state is AddAddressLoadedState) {
                context.read<AddressBloc>().add(GetAddress());
                context.goNamed('address');
              } else {}
            },
            builder: (context, state) {
              if (state is AddAddressLoadingState) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return MyButtons.primary(context, 'Save', () {
                  // print('Test');
                  context.read<AddressBloc>().add(AddAddress(
                        Address(
                          name: nameController.text,
                          address: addressController.text,
                          phone: phoneNumberController.text,
                          provinceId: selectedProvince.provinceId,
                          cityId: selectedCity.cityId,
                          districtId: selectedSubdistrict.subdistrictId,
                          postalCode: postalCodeController.text,
                          userId: 2,
                          isDefault: 0,
                        ),
                      ));
                });
              }
            },
          )
        ],
      ),
    );
  }
}
