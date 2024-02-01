import 'package:bank_pit_bwa/shared/theme.dart';
import 'package:bank_pit_bwa/ui/widgets/buttons.dart';
import 'package:bank_pit_bwa/ui/widgets/profile_menu_item.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBackgroundColor,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        iconTheme: IconThemeData(
          color: blackColor,
        ),
        title: Text(
          'My Profile',
          style: blackTextStyle.copyWith(
            fontWeight: semiBlod,
            fontSize: 20,
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        children: [
          const SizedBox(
            height: 20,
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 22,
            ),
            decoration: BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                Container(
                  width: 120,
                  height: 120,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage(
                        'assets/images/img_profile.png',
                      ),
                    ),
                  ),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      width: 28,
                      height: 28,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: whiteColor,
                      ),
                      child: Center(
                        child: Icon(
                          Icons.check_circle,
                          color: greenColor,
                          size: 24,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  'Rafi Zimraan',
                  style: blackTextStyle.copyWith(
                    fontWeight: medium,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                ProfileMenuItem(
                  iconUrl: 'assets/icons/ic_edit_profile.png',
                  title: 'Edit Profile',
                  ontap: () {},
                ),
                ProfileMenuItem(
                  iconUrl: 'assets/icons/ic_pin.png',
                  title: 'My Pin',
                  ontap: () {},
                ),
                ProfileMenuItem(
                  iconUrl: 'assets/icons/ic_wallet.png',
                  title: 'Wallet Settings',
                  ontap: () {},
                ),
                ProfileMenuItem(
                  iconUrl: 'assets/icons/ic_reward.png',
                  title: 'My Rewards',
                  ontap: () {},
                ),
                ProfileMenuItem(
                  iconUrl: 'assets/icons/ic_help.png',
                  title: 'help Center',
                  ontap: () {},
                ),
                ProfileMenuItem(
                  iconUrl: 'assets/icons/ic_logout.png',
                  title: 'Log Out',
                  ontap: () {},
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 87,
          ),
          CustomTextButton(
            title: 'Report  a Problem',
            onpressed: () {},
          ),
          const SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }
}
