import 'package:bank_pit_bwa/blocs/auth/auth_bloc.dart';
import 'package:bank_pit_bwa/models/sign_in_form_model.dart';
import 'package:bank_pit_bwa/models/sign_up_form_model.dart';
import 'package:bank_pit_bwa/shared/shared_methods.dart';
import 'package:bank_pit_bwa/shared/theme.dart';
import 'package:bank_pit_bwa/ui/widgets/buttons.dart';
import 'package:bank_pit_bwa/ui/widgets/forms.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final emailController = TextEditingController(text: '');
  final passwordController = TextEditingController(text: '');

  bool validate() {
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBackgroundColor,
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthFailed) {
            showCustomSnackBar(context, state.e);
          }

          if (state is AuthSuccess) {
            Navigator.pushNamedAndRemoveUntil(
                context, '/home', (route) => false);
          }
        },
        builder: (context, state) {
          if (state is AuthLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return ListView(
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
            ),
            children: [
              Container(
                height: 50,
                width: 150,
                margin: const EdgeInsets.only(
                  top: 100,
                  bottom: 100,
                ),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      'assets/images/img_logo_light.png',
                    ),
                  ),
                ),
              ),
              Text(
                'Sign In \nFor start your Apps',
                style: blackTextStyle.copyWith(
                  fontSize: 20,
                  fontWeight: semiBlod,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                padding: const EdgeInsets.all(22),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: whiteColor,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //  NOTE: EMAIL INPUT
                    CustomFormField(
                      title: 'Email Address',
                      controller: emailController,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    //  NOTE: PASSWORD INPUT
                    CustomFormField(
                      title: 'Password',
                      obscureText: true,
                      controller: passwordController,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        'Forgot Password',
                        style: blueTextStyle,
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    CustomFilledButton(
                      title: 'Sign In',
                      onpressed: () {
                        if (validate()) {
                          context.read<AuthBloc>().add(
                                AuthLogin(
                                  SignInFormModel(
                                    email: emailController.text,
                                    password: passwordController.text,
                                  ),
                                ),
                              );
                        } else {
                          showCustomSnackBar(
                              context, 'Semua Field harus di isi');
                        }
                      },
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              CustomTextButton(
                title: 'Create New Account',
                onpressed: () {
                  Navigator.pushNamed(context, '/sign-up');
                },
              )
            ],
          );
        },
      ),
    );
  }
}
