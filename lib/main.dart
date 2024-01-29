import 'package:bank_pit_bwa/ui/pages/home_page.dart';
import 'package:bank_pit_bwa/ui/pages/onboarding_page.dart';
import 'package:bank_pit_bwa/ui/pages/signIn_page.dart';
import 'package:bank_pit_bwa/ui/pages/sign_up_page.dart';
import 'package:bank_pit_bwa/ui/pages/sign_up_set_ktp_page%20.dart';
import 'package:bank_pit_bwa/ui/pages/sign_up_set_profile_page.dart';
import 'package:bank_pit_bwa/ui/pages/sign_up_success_page.dart';
import 'package:bank_pit_bwa/ui/pages/splash_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const SplashPage(),
        '/onboarding': (context) => const OnboardingPage(),
        '/sign-in': (context) => const SignInPage(),
        '/sign-up': (context) => const SignUpPage(),
        '/sign-up-set-profile': (context) => const SignUpUpSetProfilePage(),
        '/sign-up-set-ktp': (context) => const SignUpUpSetKtpPage(),
        '/sign-up-success': (context) => const SignUpSuccessPage(),
        '/home': (context) => const HomePage(),
      },
    );
  }
}
