import 'package:flt_warungol_fic12/controllers/auth/signup_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../configs/x_configs.dart';
import '../../controllers/x_controllers.dart';
import '../../datasources/local/x_locals.dart';
import '../../models/x_models.dart';
import '../../widgets/x_widgets.dart';
import 'x_auths.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  TypeLoginIs typeLogin = TypeLoginIs.email; //phoneNumber;
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  late CountryModel selectedCountry;

  @override
  void initState() {
    selectedCountry = countries.first;
    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 40.0),
        children: [
          const Text(
            'Register Account',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          const Text(
            'Hello, please complete the data below to signup',
            style: TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 50.0),
          SelectTypeLogin(
            typeLoginIs: typeLogin,
            onChanged: (value) {
              typeLogin = value;
              setState(() {});
            },
          ),
          if (typeLogin.isEmail) ...[
            const SizedBox(height: 60.0),
            TextFormField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: 'Full Name',
                labelStyle: const TextStyle(color: kAppInversePrimary),
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: SvgPicture.asset(
                    'lib/assets/icons/person.svg',
                    height: 24,
                    colorFilter: const ColorFilter.mode(
                      kAppInversePrimary,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            TextFormField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'Email ID',
                labelStyle: const TextStyle(color: kAppInversePrimary),
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: SvgPicture.asset(
                    'lib/assets/icons/email.svg',
                    height: 24,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            TextFormField(
              controller: phoneController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                labelText: 'Phone Number',
                labelStyle: const TextStyle(color: kAppInversePrimary),
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: SvgPicture.asset(
                    'lib/assets/icons/phone-svgrepo-com.svg',
                    height: 24,
                    colorFilter: const ColorFilter.mode(
                      kAppInversePrimary,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            TextFormField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                labelStyle: const TextStyle(color: kAppInversePrimary),
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: SvgPicture.asset(
                    'lib/assets/icons/password.svg',
                    height: 24,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            TextFormField(
              controller: confirmPasswordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Confirm Password',
                labelStyle: const TextStyle(color: kAppInversePrimary),
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: SvgPicture.asset(
                    'lib/assets/icons/password.svg',
                    height: 24,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 50.0),
            BlocConsumer<SignupBloc, SignupState>(
              listener: (context, state) {
                if (state is SignupValidation) {
                  MySnackbar.danger(context, 'Fail', state.value!);
                } else if (state is SignupErrorState) {
                  MySnackbar.danger(context, 'Error', state.error!);
                } else if (state is SignupSuccessState) {
                  AuthLocalData.saveAuthData(state.dataOutput);
                  context.goNamed('orderDetail');
                }
              },
              builder: (context, state) {
                if (state is SignupLoadingState) {
                  return MyButtons.isLoading(context, '...Loading');
                } else {
                  return MyButtons.primary(context, 'Signup', () {
                    print('---Signup');
                    context.read<SignupBloc>().add(GetSignup(
                          fullname: nameController.text,
                          email: emailController.text,
                          phoneNumber: phoneController.text,
                          password: passwordController.text,
                        ));
                  });
                }
              },
            ),
          ] else if (typeLogin.isPhoneNumber) ...[
            const SizedBox(height: 80.0),
            TextFormField(
              controller: phoneController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Phone Number',
                labelStyle: const TextStyle(color: kAppInversePrimary),
                prefixIcon: DropdownButton<CountryModel>(
                  value: selectedCountry,
                  items: countries.map<DropdownMenuItem<CountryModel>>(
                      (CountryModel country) {
                    return DropdownMenuItem<CountryModel>(
                      value: country,
                      child: Row(
                        children: [
                          Image.network(
                            country.flag,
                            width: 24.0,
                            height: 24.0,
                            fit: BoxFit.contain,
                          ),
                          const SizedBox(width: 10.0),
                          Text('+${country.phoneCode}'),
                        ],
                      ),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      final selected = value ?? selectedCountry;
                      selectedCountry = selected;
                    });
                  },
                ),
              ),
            ),
            const SizedBox(height: 50.0),
            MyButtons.primary(context, 'Send OTP', () {
              context.goNamed('verification');
            }),
          ],
          const SizedBox(height: 50.0),
          const Row(
            children: [
              Flexible(child: Divider()),
              SizedBox(width: 14.0),
              Text('OR'),
              SizedBox(width: 14.0),
              Flexible(child: Divider()),
            ],
          ),
          const SizedBox(height: 50.0),
          MyButtons.primaryIconned(context, 'Signup with Google',
              Image.asset('lib/assets/images/google.png', width: 20), () {
            context.goNamed('root');
          }),
          const SizedBox(height: 50.0),
          InkWell(
            onTap: () {
              context.goNamed('signin');
            },
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'Already have an Account? ',
                    style: TextStyle(
                      color: kAppInversePrimary.withOpacity(.8),
                    ),
                  ),
                  TextSpan(
                    text: 'Signin Now',
                    style: TextStyle(
                      color: kAppInversePrimary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 20.0),
          InkWell(
            onTap: () {
              context.goNamed('root');
            },
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'Continue Shopping, ',
                    style: TextStyle(
                      color: kAppInversePrimary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  TextSpan(
                    text: 'I will signup later',
                    style: TextStyle(
                      color: kAppInversePrimary.withOpacity(.8),
                    ),
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
