import 'dart:async';

import 'package:bank_pit_bwa/blocs/auth/auth_bloc.dart';
import 'package:bank_pit_bwa/shared/theme.dart';
import 'package:bank_pit_bwa/ui/pages/onboarding_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkBackgroundColor,
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthSuccess) {
            Navigator.pushNamedAndRemoveUntil(
                context, '/home', (route) => false);
          }

          if (state is AuthFailed) {
            Navigator.pushNamedAndRemoveUntil(
                context, '/onboarding', (route) => false);
          }
        },
        child: Center(
          child: Container(
            width: 155,
            height: 50,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/img_logo_dark.png'),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
