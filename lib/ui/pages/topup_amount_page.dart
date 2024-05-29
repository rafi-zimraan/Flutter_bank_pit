import 'package:bank_pit_bwa/blocs/auth/auth_bloc.dart';
import 'package:bank_pit_bwa/blocs/topup/topup_bloc.dart';
import 'package:bank_pit_bwa/models/topup_form_model.dart';
import 'package:bank_pit_bwa/shared/shared_methods.dart';
import 'package:bank_pit_bwa/shared/theme.dart';
import 'package:bank_pit_bwa/ui/widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class TopupAmountPage extends StatefulWidget {
  final TopupFormModel data;

  const TopupAmountPage({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  State<TopupAmountPage> createState() => _TopupAmountPagetate();
}

class _TopupAmountPagetate extends State<TopupAmountPage> {
  final TextEditingController amountController =
      TextEditingController(text: '0');

  @override
  void initState() {
    super.initState();
    amountController.addListener(() {
      final text = amountController.text;

      amountController.value = amountController.value.copyWith(
        text: NumberFormat.currency(
          locale: 'id',
          decimalDigits: 0,
          symbol: '',
        ).format(
          isValidNumber(text) ? double.parse(text.replaceAll('.', '')) : 0,
        ),
      );
    });
  }

  bool isValidNumber(String value) {
    try {
      double.parse(value.replaceAll('.', ''));
      return true;
    } catch (e) {
      return false;
    }
  }

  addAmount(String number) {
    if (amountController.text == '0') {
      amountController.text = '';
    }
    setState(
      () {
        amountController.text = amountController.text + number;
      },
    );
  }

  deleteAmount() {
    if (amountController.text.isNotEmpty) {
      setState(
        () {
          amountController.text = amountController.text
              .substring(0, amountController.text.length - 1);
          if (amountController.text == '') {
            amountController.text = '0';
          }
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkBackgroundColor,
      body: BlocProvider(
        create: (context) => TopupBloc(),
        child: BlocConsumer<TopupBloc, TopupState>(
          listener: (context, state) async {
            if (state is TopupFailed) {
              showCustomSnackBar(context, state.e);
            }

            if (state is TopupSuccess) {
              await launchUrl(Uri.parse(state.redirectUrl));

              context.read<AuthBloc>().add(
                    AuthUpdateBelance(
                      int.parse(
                        amountController.text.replaceAll('.', ''),
                      ),
                    ),
                  );

              Navigator.pushNamedAndRemoveUntil(
                  context, '/topup-success', (route) => false);
            }
          },
          builder: (context, state) {
            return ListView(
              padding: const EdgeInsets.symmetric(
                horizontal: 58,
              ),
              children: [
                const SizedBox(
                  height: 60,
                ),
                Center(
                  child: Text(
                    "Total Amount",
                    style: whiteTextStyle.copyWith(
                      fontWeight: semiBlod,
                      fontSize: 20,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 67,
                ),
                Align(
                  child: SizedBox(
                    width: 220,
                    child: TextFormField(
                      controller: amountController,
                      cursorColor: greyColor,
                      enabled: false,
                      style: whiteTextStyle.copyWith(
                        fontSize: 36,
                        fontWeight: medium,
                      ),
                      decoration: InputDecoration(
                        prefixIcon: Text(
                          'Rp',
                          style: whiteTextStyle.copyWith(
                            fontSize: 36,
                            fontWeight: medium,
                          ),
                        ),
                        disabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: greyColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Wrap(
                  spacing: 30,
                  runSpacing: 30,
                  children: [
                    CustomInputButton(
                      title: '1',
                      ontap: () {
                        addAmount('1');
                      },
                    ),
                    CustomInputButton(
                      title: '2',
                      ontap: () {
                        addAmount('2');
                      },
                    ),
                    CustomInputButton(
                      title: '3',
                      ontap: () {
                        addAmount('3');
                      },
                    ),
                    CustomInputButton(
                      title: '4',
                      ontap: () {
                        addAmount('4');
                      },
                    ),
                    CustomInputButton(
                      title: '5',
                      ontap: () {
                        addAmount('5');
                      },
                    ),
                    CustomInputButton(
                      title: '6',
                      ontap: () {
                        addAmount('6');
                      },
                    ),
                    CustomInputButton(
                      title: '7',
                      ontap: () {
                        addAmount('7');
                      },
                    ),
                    CustomInputButton(
                      title: '8',
                      ontap: () {
                        addAmount('8');
                      },
                    ),
                    CustomInputButton(
                      title: '9',
                      ontap: () {
                        addAmount('9');
                      },
                    ),
                    const SizedBox(
                      height: 60,
                      width: 60,
                    ),
                    CustomInputButton(
                      title: '0',
                      ontap: () {
                        addAmount('0');
                      },
                    ),
                    GestureDetector(
                      onTap: () {
                        deleteAmount();
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
                const SizedBox(
                  height: 50,
                ),
                CustomFilledButton(
                  title: 'CheckOut Now',
                  onpressed: () async {
                    if (await Navigator.pushNamed(context, '/pin') == true) {
                      final authState = context.read<AuthBloc>().state;
                      String pin = '';
                      if (authState is AuthSuccess) {
                        pin = authState.user.pin!;
                      }

                      context.read<TopupBloc>().add(
                            TopupPost(
                              widget.data.copyWith(
                                  pin: pin,
                                  amount: amountController.text
                                      .replaceAll('.', '')),
                            ),
                          );
                    }
                  },
                ),
                const SizedBox(
                  height: 25,
                ),
                CustomTextButton(
                  title: 'Terms & Conditions',
                  onpressed: () {},
                ),
                const SizedBox(
                  height: 40,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
