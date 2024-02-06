import 'package:bank_pit_bwa/shared/theme.dart';
import 'package:flutter/material.dart';

class TransferRecentUserItem extends StatelessWidget {
  final String imgUrl;
  final String name;
  final String username;
  final bool isVerified;

  const TransferRecentUserItem({
    Key? key,
    required this.imgUrl,
    required this.name,
    required this.username,
    this.isVerified = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        bottom: 18,
      ),
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: whiteColor,
      ),
      child: Row(
        children: [
          Container(
            width: 45,
            height: 45,
            margin: const EdgeInsets.only(
              right: 14,
            ),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage(imgUrl),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: blackTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: medium,
                ),
              ),
              const SizedBox(
                height: 2,
              ),
              Text(
                '@$username',
                style: greyTextStyle.copyWith(
                  fontSize: 12,
                ),
              )
            ],
          ),
          const Spacer(),
          if (isVerified)
            Row(
              children: [
                Icon(
                  Icons.check_circle,
                  size: 14,
                  color: greenColor,
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  'Verified',
                  style: greenTextStyle.copyWith(
                    fontWeight: medium,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
