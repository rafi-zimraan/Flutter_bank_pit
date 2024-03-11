import 'dart:convert';
import 'dart:io';

import 'package:bank_pit_bwa/models/sign_up_form_model.dart';
import 'package:bank_pit_bwa/shared/shared_methods.dart';
import 'package:bank_pit_bwa/shared/theme.dart';
import 'package:bank_pit_bwa/ui/pages/sign_up_set_ktp_page%20.dart';
import 'package:bank_pit_bwa/ui/widgets/buttons.dart';
import 'package:bank_pit_bwa/ui/widgets/forms.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class SignUpUpSetProfilePage extends StatefulWidget {
  final SignUpFormModel data;

  const SignUpUpSetProfilePage({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  State<SignUpUpSetProfilePage> createState() => _SignUpUpSetProfilePageState();
}

class _SignUpUpSetProfilePageState extends State<SignUpUpSetProfilePage> {
  final pinController = TextEditingController(text: '');
  XFile? selectedImage;

  bool validate() {
    if (pinController.text.length != 6) {
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    // print(widget.data.toJson()); // ! Untuk melihat data di console
    return Scaffold(
      backgroundColor: lightBackgroundColor,
      body: ListView(
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
              children: [
                GestureDetector(
                  onTap: () async {
                    final image = await selectImage();
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
                  'Rafi Zimraan A. W',
                  style: blackTextStyle.copyWith(
                    fontSize: 18,
                    fontWeight: medium,
                  ),
                ),
                const SizedBox(
                  height: 60,
                ),
                CustomFormField(
                  title: 'Set PIN 16 (6  digit number)',
                  obscureText: true,
                  controller: pinController,
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomFilledButton(
                  title: 'Continue',
                  onpressed: () {
                    if (validate()) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignUpUpSetKtpPage(
                            data: widget.data.copyWith(
                              pin: pinController.text,
                              profilePicture: selectedImage == null
                                  ? null
                                  : 'data:image/png;base64,' +
                                      base64Encode(
                                        File(selectedImage!.path)
                                            .readAsBytesSync(),
                                      ),
                            ),
                          ),
                        ),
                      );
                    } else {
                      showCustomSnackBar(context, 'Pin Harus 6 digid bro');
                    }
                  },
                )
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }
}
