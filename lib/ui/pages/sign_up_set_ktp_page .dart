import 'dart:convert';
import 'dart:io';

import 'package:bank_pit_bwa/blocs/auth/auth_bloc.dart';
import 'package:bank_pit_bwa/models/sign_up_form_model.dart';
import 'package:bank_pit_bwa/shared/shared_methods.dart';
import 'package:bank_pit_bwa/shared/theme.dart';
import 'package:bank_pit_bwa/ui/widgets/buttons.dart';
import 'package:bank_pit_bwa/ui/widgets/forms.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class SignUpUpSetKtpPage extends StatefulWidget {
  final SignUpFormModel data;

  const SignUpUpSetKtpPage({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  State<SignUpUpSetKtpPage> createState() => _SignUpUpSetKtpPageState();
}

class _SignUpUpSetKtpPageState extends State<SignUpUpSetKtpPage> {
  XFile? selectedImage;

  bool validate() {
    if (selectedImage == null) {
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
                'Verify Your Account\nNow',
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
                  children: [
                    GestureDetector(
                      onTap: () async {
                        final image = await selectImage();
                        print('Selected Image path: ${image?.path}');
                        setState(() {
                          selectedImage = image;
                        });
                      },
                      child: Container(
                        height: 120,
                        width: 120,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: lightBackgroundColor,
                          image: selectedImage == null
                              ? null
                              : DecorationImage(
                                  fit: BoxFit.cover,
                                  image: FileImage(
                                    File(selectedImage!.path),
                                  ),
                                ),
                        ),
                        child: selectedImage != null
                            ? null
                            : Center(
                                child: Image.asset(
                                  'assets/icons/ic_upload.png',
                                  width: 32,
                                ),
                              ),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Text(
                      'Ktp/Passport/ID Card',
                      style: blackTextStyle.copyWith(
                        fontSize: 18,
                        fontWeight: medium,
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    CustomFilledButton(
                      title: 'Continue',
                      onpressed: () {
                        if (validate()) {
                          if (validate()) {
                            print(
                                'Selected Image Path before sending to server: ${selectedImage?.path}');
                            context.read<AuthBloc>().add(
                                  AuthRegister(
                                    widget.data.copyWith(
                                      ktp: selectedImage == null
                                          ? null
                                          : 'data:image/png;base64,' +
                                              base64Encode(
                                                File(selectedImage!.path)
                                                    .readAsBytesSync(),
                                              ),
                                    ),
                                  ),
                                );
                            if (widget.data.ktp != null) {
                              print(
                                  'Mengirim permintaan registrasi ke server... KTP: ${widget.data.ktp ?? "null"}');
                            }
                          }
                        } else {
                          showCustomSnackBar(
                              context, 'Pilih gambar KTP terlebih dahulu');
                        }
                      },
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 60,
              ),
              CustomTextButton(
                title: 'Skip For Now',
                onpressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, '/home', (route) => false);
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
