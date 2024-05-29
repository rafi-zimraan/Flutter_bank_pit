import 'package:bank_pit_bwa/models/user_model.dart';
import 'package:bank_pit_bwa/shared/theme.dart';
import 'package:flutter/material.dart';

class TransferRecentUserItem extends StatelessWidget {
  final UserModel user;

  const TransferRecentUserItem({
    Key? key,
    required this.user,
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
                image: user.profilePicture != null
                    ? const AssetImage(
                        'assets/images/img_profile.png',
                      )
                    : NetworkImage(user.profilePicture!) as ImageProvider,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                user.name.toString(),
                style: blackTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: medium,
                ),
              ),
              const SizedBox(
                height: 2,
              ),
              Text(
                '@${user.username}',
                style: greyTextStyle.copyWith(
                  fontSize: 12,
                ),
              )
            ],
          ),
          const Spacer(),
          if (user.verified == 1)
            Row(
              children: [
                Icon(
                  Icons.check_circle,
                  size: 12,
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
