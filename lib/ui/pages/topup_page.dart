import 'package:bank_pit_bwa/shared/theme.dart';
import 'package:bank_pit_bwa/ui/widgets/bank_item.dart';
import 'package:bank_pit_bwa/ui/widgets/buttons.dart';
import 'package:flutter/material.dart';

class TopupPage extends StatelessWidget {
  const TopupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Topup',
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
        ),
        children: [
          const SizedBox(
            height: 30,
          ),
          Text(
            'Wallet',
            style: blackTextStyle.copyWith(
              fontWeight: semiBlod,
              fontSize: 16,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Image.asset(
                'assets/images/img_wallet.png',
                width: 80,
              ),
              const SizedBox(
                width: 16,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '0872 8362 8899',
                    style: blackTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: medium,
                    ),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Text(
                    'Jendral Sudirman',
                    style: greyTextStyle.copyWith(
                      fontSize: 12,
                    ),
                  )
                ],
              )
            ],
          ),
          const SizedBox(
            height: 40,
          ),
          Text(
            'Select Bank',
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semiBlod,
            ),
          ),
          const SizedBox(
            height: 14,
          ),
          const BankItem(
            title: "BANK BCA",
            imgUrl: 'assets/images/img_bank_bca.png',
            isSelected: true,
          ),
          const BankItem(
            title: "BANK BNI",
            imgUrl: 'assets/images/img_bank_bni.png',
          ),
          const BankItem(
            title: "BANK MANDRIR",
            imgUrl: 'assets/images/img_bank_mandiri.png',
          ),
          const BankItem(
            title: "BANK OCBC",
            imgUrl: 'assets/images/img_bank_ocbc.png',
          ),
          const SizedBox(
            height: 12,
          ),
          CustomFilledButton(
            title: "Continue",
            onpressed: () {
              Navigator.pushNamed(context, '/topup-amount');
            },
          ),
          const SizedBox(
            height: 57,
          ),
        ],
      ),
    );
  }
}
