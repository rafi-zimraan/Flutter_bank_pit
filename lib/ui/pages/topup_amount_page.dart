// ignore_for_file: depend_on_referenced_packages

import 'package:bank_pit_bwa/shared/theme.dart';
import 'package:bank_pit_bwa/ui/widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart' as launcher;
import 'package:intl/intl.dart';

class TopupAmountPage extends StatefulWidget {
  const TopupAmountPage({Key? key}) : super(key: key);

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
      body: ListView(
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
            height: 66,
          ),
          Wrap(
            spacing: 40,
            runSpacing: 40,
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
                await launcher
                    .launchUrl(Uri.parse('https://demo.midtrans.com/'));

                Navigator.pushNamedAndRemoveUntil(
                    context, '/topup-success', (route) => false);
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
      ),
    );
  }
}
