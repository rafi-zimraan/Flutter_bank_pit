// ignore_for_file: use_build_context_synchronously

import 'package:bank_pit_bwa/blocs/auth/auth_bloc.dart';
import 'package:bank_pit_bwa/shared/shared_methods.dart';
import 'package:bank_pit_bwa/shared/theme.dart';
import 'package:bank_pit_bwa/ui/widgets/buttons.dart';
import 'package:bank_pit_bwa/ui/widgets/profile_menu_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBackgroundColor,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        iconTheme: IconThemeData(
          color: blackColor,
        ),
        title: Text(
          'My Profile',
          style: blackTextStyle.copyWith(
            fontWeight: semiBlod,
            fontSize: 20,
          ),
        ),
      ),
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthFailed) {
            showCustomSnackBar(context, state.e);
          }

          if (state is AuthInitial) {
            Navigator.pushNamedAndRemoveUntil(
                context, '/sign-in', (route) => false);
          }
        },
        builder: (context, state) {
          if (state is AuthLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            children: [
              const SizedBox(
                height: 20,
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 22,
                ),
                decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    Container(
                      width: 120,
                      height: 120,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage(
                            'assets/images/img_profile.png',
                          ),
                        ),
                      ),
                      child: Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          width: 28,
                          height: 28,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: whiteColor,
                          ),
                          child: Center(
                            child: Icon(
                              Icons.check_circle,
                              color: greenColor,
                              size: 24,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Text(
                      'Rafi Zimraan',
                      style: blackTextStyle.copyWith(
                        fontWeight: medium,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    ProfileMenuItem(
                      iconUrl: 'assets/icons/ic_edit_profile.png',
                      title: 'Edit Profile',
                      ontap: () async {
                        if (await Navigator.pushNamed(context, '/pin') ==
                            true) {
                          Navigator.pushNamed(context, '/profile-edit');
                        }
                      },
                    ),
                    ProfileMenuItem(
                      iconUrl: 'assets/icons/ic_pin.png',
                      title: 'My Pin',
                      ontap: () async {
                        if (await Navigator.pushNamed(context, '/pin') ==
                            true) {
                          Navigator.pushNamed(context, '/profile-edit-pin');
                        }
                      },
                    ),
                    ProfileMenuItem(
                      iconUrl: 'assets/icons/ic_wallet.png',
                      title: 'Wallet Settings',
                      ontap: () {},
                    ),
                    ProfileMenuItem(
                      iconUrl: 'assets/icons/ic_reward.png',
                      title: 'My Rewards',
                      ontap: () {},
                    ),
                    ProfileMenuItem(
                      iconUrl: 'assets/icons/ic_help.png',
                      title: 'help Center',
                      ontap: () {},
                    ),
                    ProfileMenuItem(
                      iconUrl: 'assets/icons/ic_logout.png',
                      title: 'Log Out',
                      ontap: () {
                        context.read<AuthBloc>().add(AuthLogout());
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              CustomTextButton(
                title: 'Report  a Problem',
                onpressed: () {},
              ),
              const SizedBox(
                height: 50,
              ),
            ],
          );
        },
      ),
    );
  }
}
