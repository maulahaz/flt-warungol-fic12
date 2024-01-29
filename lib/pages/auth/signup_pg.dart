import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../configs/x_configs.dart';
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
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final countries = [
    CountryModel(
      name: 'Indonesia',
      flag:
          'https://upload.wikimedia.org/wikipedia/commons/0/0b/Flag_of_Indonesia.png',
      phoneCode: 62,
    ),
    CountryModel(
      name: 'Spanish',
      flag:
          'https://w7.pngwing.com/pngs/124/420/png-transparent-flag-of-spain-spanish-language-education-english-translation-spain-flag-miscellaneous-flag-text.png',
      phoneCode: 34,
    ),
    CountryModel(
      name: 'English',
      flag:
          'https://upload.wikimedia.org/wikipedia/commons/f/fc/Flag_of_Great_Britain_%28English_version%29.png',
      phoneCode: 44,
    ),
  ];
  late CountryModel selectedCountry;

  @override
  void initState() {
    selectedCountry = countries.first;
    super.initState();
  }

  @override
  void dispose() {
    phoneController.dispose();
    emailController.dispose();
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
            MyButtons.primary(context, 'Signup', () {
              context.goNamed('/');
            }),
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
            context.goNamed('/');
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
        ],
      ),
    );
  }
}
