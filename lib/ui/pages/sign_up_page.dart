import 'package:bank_pit_bwa/blocs/auth/auth_bloc.dart';
import 'package:bank_pit_bwa/models/sign_up_form_model.dart';
import 'package:bank_pit_bwa/shared/shared_methods.dart';
import 'package:bank_pit_bwa/shared/theme.dart';
import 'package:bank_pit_bwa/ui/pages/sign_up_set_profile_page.dart';
import 'package:bank_pit_bwa/ui/widgets/buttons.dart';
import 'package:bank_pit_bwa/ui/widgets/forms.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final nameController = TextEditingController(text: '');
  final emailController = TextEditingController(text: '');
  final passwordController = TextEditingController(text: '');

  bool validate() {
    if (nameController.text.isEmpty ||
        emailController.text.isEmpty ||
        passwordController.text.isEmpty) {
      return false;
    } else {
      return true;
    }
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

          if (state is AuthCheckEmailSuccess) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SignUpUpSetProfilePage(
                  data: SignUpFormModel(
                    name: nameController.text,
                    email: emailController.text,
                    password: passwordController.text,
                  ),
                ),
              ),
            );
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
                'Sign Up Bro \nAnd improve your skill',
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
                    //  NOTE: USERNAME INPUT
                    CustomFormField(
                      title: 'Full Name',
                      controller: nameController,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    //  NOTE: EMAIL INPUT
                    CustomFormField(
                        title: 'Email Address', controller: emailController),
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
                      height: 30,
                    ),
                    CustomFilledButton(
                      title: 'Continue ',
                      onpressed: () {
                        if (validate()) {
                          context
                              .read<AuthBloc>()
                              .add(AuthCheckEmail(emailController.text));
                        } else {
                          showCustomSnackBar(
                              context, 'Maaf semua field harus di isi semua');
                        }
                      },
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              CustomTextButton(
                title: 'SignIn',
                onpressed: () {
                  Navigator.pushNamed(context, '/sign-in');
                },
              ),
              const SizedBox(
                height: 30,
              ),
            ],
          );
        },
      ),
    );
  }
}
