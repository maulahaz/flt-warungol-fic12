import 'package:flt_warungol_fic12/datasources/local/auth_local_dt.dart';
import 'package:flt_warungol_fic12/helpers/x_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../configs/x_configs.dart';
import '../../controllers/x_controllers.dart';
import '../../widgets/x_widgets.dart';
import 'x_profiles.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: context.colorSchema.background,
        title: const Text('Profile'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(30.0),
        children: [
          const SizedBox(height: 16.0),
          // final isAuth = AuthLocalData.isAuth();
          const Text(
            'Welcome',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 8.0),
          BlocBuilder<AuthBloc, AuthState>(
            builder: (context, state) {
              if (state is AuthSignedInState) {
                return Text(
                  'Mr/Ms. ${state.dataOutput.user.name}',
                  style: const TextStyle(
                    color: kAppInversePrimary,
                  ),
                );
              } else {
                return Text(
                  'Guess',
                  style: const TextStyle(
                    color: kAppInversePrimary,
                  ),
                );
              }
            },
          ),
          // FutureBuilder<AuthModel>(
          //     future: AuthLocalData.getAuthData(),
          //     builder: (context, snapshot) {
          //       if (snapshot.hasData) {
          //         return Text(
          //           'Mr/Ms. ${snapshot.data!.user.name}',
          //           style: const TextStyle(
          //             color: kAppInversePrimary,
          //           ),
          //         );
          //       } else {
          //         return Text(
          //           'Guess',
          //           style: const TextStyle(
          //             color: kAppInversePrimary,
          //           ),
          //         );
          //       }
          //     }),
          const SizedBox(height: 24.0),
          const Text(
            'Detail Account',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 8.0),
          ProfileMenu(
            label: 'Edit Profile',
            onPressed: () async {
              print('Cek isAuth');
              final isAuth = await AuthLocalData.isAuth();
              if (isAuth) {
                print('Auth');
              } else {
                print('Not Auth');
              }
            },
          ),
          ProfileMenu(
            label: 'Help',
            onPressed: () {},
          ),
          ProfileMenu(
            label: 'Privacy & Policy',
            onPressed: () {},
          ),
          ProfileMenu(
            label: 'Term of Service',
            onPressed: () {},
          ),
          const SizedBox(height: 24.0),
          BlocConsumer<AuthBloc, AuthState>(
            listener: (context, state) {
              if (state is AuthErrorState) {
                MySnackbar.danger(context, 'Error', state.error!);
              }
              // else if (state is AuthSignedInState) {
              //   context.goNamed('root');
              // }
            },
            builder: (context, state) {
              if (state is AuthSignedInState) {
                return ProfileMenu(
                  label: 'Signout',
                  onPressed: () {
                    context.read<AuthBloc>().add(GetSignout());
                    context.goNamed('root', extra: 1);
                  },
                );
              } else {
                return ProfileMenu(
                  label: 'Signin',
                  onPressed: () {
                    context.goNamed('signin');
                  },
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
