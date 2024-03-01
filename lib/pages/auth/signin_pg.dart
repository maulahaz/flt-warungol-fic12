import 'package:flt_warungol_fic12/controllers/x_controllers.dart';
import 'package:flt_warungol_fic12/widgets/x_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../configs/x_configs.dart';
import '../../datasources/local/x_locals.dart';
import '../../datasources/remote/firebase_messaging_remote_dt.dart';
import '../../models/x_models.dart';
import 'x_auths.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({super.key});

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  TypeLoginIs typeLogin = TypeLoginIs.email; //phoneNumber;
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

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
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 40.0),
        children: [
          const Text(
            'Login Account',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          const Text(
            'Hello, welcome back to $APP_NAME',
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
          if (typeLogin.isPhoneNumber) ...[
            const SizedBox(height: 80.0),
            TextFormField(
              controller: phoneController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Phone Number',
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
            })
          ] else if (typeLogin.isEmail) ...[
            const SizedBox(height: 60.0),
            TextFormField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              cursorColor: kAppInversePrimary,
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
              cursorColor: kAppInversePrimary,
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
            const SizedBox(height: 50.0),
            BlocConsumer<AuthBloc, AuthState>(
              listener: (context, state) async {
                if (state is SigninValidation) {
                  MySnackbar.danger(context, 'Fail', state.value!);
                } else if (state is AuthErrorState) {
                  MySnackbar.danger(context, 'Error', state.error!);
                } else if (state is AuthSignedInState) {
                  //--Save AuthData to Local:
                  AuthLocalData.saveAuthData(state.dataOutput);

                  //--ReInitial to make sure FCM-ID updated in server:
                  await FirebaseMessagingRemoteData().init();

                  // context.goNamed('orderDetail');
                  context.goNamed('root');
                }
              },
              builder: (context, state) {
                if (state is AuthLoadingState) {
                  return MyButtons.isLoading(context, '...Loading');
                } else {
                  return MyButtons.primary(context, 'Signin', () {
                    print('---Login');
                    context.read<AuthBloc>().add(GetSignin(
                        email: emailController.text,
                        password: passwordController.text));
                  });
                }
              },
            )
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
          MyButtons.primary(context, 'Signin with Google', () {
            context.goNamed('root');
          }),
          // Button.outlined(
          //   onPressed: () {},
          //   label: 'Login with Google',
          //   icon: Assets.images.google.image(height: 20.0),
          // ),
          const SizedBox(height: 50.0),
          InkWell(
            onTap: () {
              context.goNamed('signup');
            },
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'Not Registered yet? ',
                    style: TextStyle(
                      color: kAppInversePrimary.withOpacity(.8),
                    ),
                  ),
                  TextSpan(
                    text: 'Create an Account',
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
                    text: 'I will signin later',
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
