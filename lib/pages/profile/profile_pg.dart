import 'package:flt_warungol_fic12/datasources/local/auth_local_dt.dart';
import 'package:flt_warungol_fic12/helpers/x_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../controllers/x_controllers.dart';
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
          const Text(
            'Account',
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
          ProfileMenu(
            label: 'Signout',
            onPressed: () {
              print('Signout Button');
              context.read<AuthBloc>().add(GetSignout());
              context.goNamed('home');
            },
          ),
        ],
      ),
    );
  }
}
