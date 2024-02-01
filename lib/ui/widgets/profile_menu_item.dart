import 'package:bank_pit_bwa/shared/theme.dart';
import 'package:flutter/material.dart';

class ProfileMenuItem extends StatelessWidget {
  final String iconUrl;
  final String title;
  final VoidCallback? ontap;

  const ProfileMenuItem({
    Key? key,
    required this.iconUrl,
    required this.title,
    required this.ontap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        margin: const EdgeInsets.only(
          bottom: 30,
        ),
        child: Row(
          children: [
            Image.asset(
              iconUrl,
              width: 24,
            ),
            const SizedBox(
              width: 18,
            ),
            Text(
              title,
              style: blackTextStyle.copyWith(
                fontWeight: medium,
              ),
            )
          ],
        ),
      ),
    );
  }
}
