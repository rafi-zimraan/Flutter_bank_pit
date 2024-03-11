import 'package:bank_pit_bwa/blocs/auth/auth_bloc.dart';
import 'package:bank_pit_bwa/shared/shared_methods.dart';
import 'package:bank_pit_bwa/shared/theme.dart';
import 'package:bank_pit_bwa/ui/widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PinPage extends StatefulWidget {
  const PinPage({super.key});

  @override
  State<PinPage> createState() => _PinPageState();
}

class _PinPageState extends State<PinPage> {
  final TextEditingController pinController = TextEditingController(text: '');
  String pin = '';
  bool isError = false;

  addPin(String number) {
    if (pinController.text.length < 6) {
      setState(() {
        pinController.text = pinController.text + number;
      });
    }
    // print(pinController.text);

    if (pinController.text.length == 6) {
      if (pinController.text.length == 6 && pinController.text == pin) {
        Navigator.pop(context, true);
      } else {
        setState(() {
          isError = true;
        });
        showCustomSnackBar(context,
            'Pin yang anda masukan salah. Silahkan berikan pin yang benar');
      }
    }
  }

  deletePin() {
    if (pinController.text.isNotEmpty) {
      setState(() {
        isError = false;
        pinController.text =
            pinController.text.substring(0, pinController.text.length - 1);
      });
    }
    // print(pinController.text);
  }

  @override
  void initState() {
    super.initState();
    final authState = context.read<AuthBloc>().state;
    if (authState is AuthSuccess) {
      pin = authState.user.pin!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkBackgroundColor,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 58,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Sha PIN",
                style: whiteTextStyle.copyWith(
                  fontWeight: semiBlod,
                  fontSize: 20,
                ),
              ),
              const SizedBox(
                height: 72,
              ),
              SizedBox(
                width: 200,
                child: TextFormField(
                  controller: pinController,
                  obscureText: true,
                  cursorColor: greyColor,
                  obscuringCharacter: '*',
                  enabled: false,
                  style: whiteTextStyle.copyWith(
                    fontSize: 36,
                    fontWeight: medium,
                    letterSpacing: 16,
                    color: isError ? redColor : whiteColor,
                  ),
                  decoration: InputDecoration(
                    disabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: greyColor,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 66,
              ),
              Wrap(
                spacing: 40,
                runSpacing: 40,
                children: [
                  CustomInputButton(
                    title: '1',
                    ontap: () {
                      addPin('1');
                    },
                  ),
                  CustomInputButton(
                    title: '2',
                    ontap: () {
                      addPin('2');
                    },
                  ),
                  CustomInputButton(
                    title: '3',
                    ontap: () {
                      addPin('3');
                    },
                  ),
                  CustomInputButton(
                    title: '4',
                    ontap: () {
                      addPin('4');
                    },
                  ),
                  CustomInputButton(
                    title: '5',
                    ontap: () {
                      addPin('5');
                    },
                  ),
                  CustomInputButton(
                    title: '6',
                    ontap: () {
                      addPin('6');
                    },
                  ),
                  CustomInputButton(
                    title: '7',
                    ontap: () {
                      addPin('7');
                    },
                  ),
                  CustomInputButton(
                    title: '8',
                    ontap: () {
                      addPin('8');
                    },
                  ),
                  CustomInputButton(
                    title: '9',
                    ontap: () {
                      addPin('9');
                    },
                  ),
                  const SizedBox(
                    height: 60,
                    width: 60,
                  ),
                  CustomInputButton(
                    title: '0',
                    ontap: () {
                      addPin('0');
                    },
                  ),
                  GestureDetector(
                    onTap: () {
                      deletePin();
                    },
                    child: Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: numberBackgroundColor,
                      ),
                      child: Center(
                        child: Icon(
                          Icons.arrow_back,
                          color: whiteColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
