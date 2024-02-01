import 'package:bank_pit_bwa/shared/theme.dart';
import 'package:bank_pit_bwa/ui/widgets/home_latest_transaction_item.dart';
import 'package:bank_pit_bwa/ui/widgets/home_service_item.dart';
import 'package:bank_pit_bwa/ui/widgets/home_tips_item.dart';
import 'package:bank_pit_bwa/ui/widgets/home_user_item.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBackgroundColor,
      bottomNavigationBar: BottomAppBar(
        color: whiteColor,
        shape: const CircularNotchedRectangle(),
        clipBehavior: Clip.antiAlias,
        notchMargin: 6,
        elevation: 0,
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: whiteColor,
          elevation: 0,
          selectedItemColor: blueColor,
          unselectedItemColor: blackColor,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          selectedLabelStyle: blueTextStyle.copyWith(
            fontSize: 10,
            fontWeight: medium,
          ),
          unselectedLabelStyle: blackTextStyle.copyWith(
            fontSize: 10,
            fontWeight: medium,
          ),
          items: [
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/icons/ic_overview.png',
                width: 20,
                color: blueColor,
              ),
              label: 'Overview',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/icons/ic_history.png',
                width: 20,
              ),
              label: 'History',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/icons/ic_statistic.png',
                width: 20,
              ),
              label: 'Statistic',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/icons/ic_reward.png',
                width: 20,
              ),
              label: 'Reward',
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: purpleColor,
        child: Image.asset(
          'assets/icons/ic_plus_circle.png',
          width: 24,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
        ),
        children: [
          buildProfile(context),
          buildWalletCard(),
          buildLevel(),
          buildServices(),
          buildLatestTransactions(),
          buildSendAgain(),
          buildFriendtips(),
        ],
      ),
    );
  }

  Widget buildProfile(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 35,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Zimbabwe',
                style: greyTextStyle.copyWith(
                  fontSize: 16,
                ),
              ),
              const SizedBox(
                height: 2,
              ),
              Text(
                'User',
                style: blackTextStyle.copyWith(
                  fontSize: 20,
                  fontWeight: semiBlod,
                ),
              ),
            ],
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/profile');
            },
            child: Container(
              width: 60,
              height: 60,
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
                  width: 16,
                  height: 16,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: whiteColor,
                  ),
                  child: Center(
                    child: Icon(
                      Icons.check_circle,
                      color: greenColor,
                      size: 14,
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget buildWalletCard() {
    return Container(
      width: double.infinity,
      height: 220,
      margin: EdgeInsets.only(
        top: 30,
      ),
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),
        image: const DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage('assets/images/img_bg_card.png'),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Supardi Cahyono',
            style: whiteTextStyle.copyWith(
              fontSize: 18,
              fontWeight: medium,
            ),
          ),
          const SizedBox(
            height: 28,
          ),
          Text(
            '**** **** **** 1278',
            style: whiteTextStyle.copyWith(
              fontSize: 18,
              fontWeight: medium,
              letterSpacing: 6,
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          Text(
            'Belance',
            style: whiteTextStyle,
          ),
          Text(
            'Rp 17.000',
            style: whiteTextStyle.copyWith(
              fontSize: 24,
              fontWeight: semiBlod,
            ),
          )
        ],
      ),
    );
  }

  Widget buildLevel() {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: whiteColor,
      ),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                'Level 1',
                style: blackTextStyle.copyWith(
                  fontWeight: medium,
                ),
              ),
              const Spacer(),
              Text(
                '50%',
                style: greenTextStyle.copyWith(
                  fontWeight: semiBlod,
                ),
              ),
              Text(
                'of Rp. 40.000',
                style: blackTextStyle.copyWith(
                  fontWeight: semiBlod,
                ),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(55),
            child: LinearProgressIndicator(
              minHeight: 7,
              value: 0.55,
              valueColor: AlwaysStoppedAnimation(greenColor),
              backgroundColor: lightBackgroundColor,
            ),
          )
        ],
      ),
    );
  }

  Widget buildServices() {
    return Container(
      margin: const EdgeInsets.only(top: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Make Something',
            style: blackTextStyle.copyWith(
              fontWeight: semiBlod,
              fontSize: 16,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              HomeServiceItem(
                iconUrl: 'assets/icons/ic_topup.png',
                title: 'Top Up',
                ontap: () {},
              ),
              HomeServiceItem(
                iconUrl: 'assets/icons/ic_send.png',
                title: 'Send',
                ontap: () {},
              ),
              HomeServiceItem(
                iconUrl: 'assets/icons/ic_withdraw.png',
                title: 'Withrad',
                ontap: () {},
              ),
              HomeServiceItem(
                iconUrl: 'assets/icons/ic_more.png',
                title: 'More',
                ontap: () {},
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget buildLatestTransactions() {
    return Container(
      margin: const EdgeInsets.only(top: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Latest Transactions',
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semiBlod,
            ),
          ),
          Container(
            padding: const EdgeInsets.all(22),
            margin: const EdgeInsets.only(
              top: 14,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: whiteColor,
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HomeLatestTransactionItem(
                  iconUrl: 'assets/icons/ic_transaction_cat1.png',
                  title: 'Top Up',
                  time: 'Yesterday',
                  value: '+ 50.000',
                ),
                HomeLatestTransactionItem(
                  iconUrl: 'assets/icons/ic_transaction_cat2.png',
                  title: 'Chasback',
                  time: 'Mey 19',
                  value: '+ 980.000',
                ),
                HomeLatestTransactionItem(
                  iconUrl: 'assets/icons/ic_transaction_cat3.png',
                  title: 'Withdraw',
                  time: 'Jan 22',
                  value: '+ 19.000',
                ),
                HomeLatestTransactionItem(
                  iconUrl: 'assets/icons/ic_transaction_cat4.png',
                  title: 'Transfer',
                  time: 'Juli 10',
                  value: '+ 30.000',
                ),
                HomeLatestTransactionItem(
                  iconUrl: 'assets/icons/ic_transaction_cat5.png',
                  title: 'Electric',
                  time: 'Maret 1',
                  value: '+ 850.000',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildSendAgain() {
    return Container(
      margin: const EdgeInsets.only(top: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Seed Again ',
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semiBlod,
            ),
          ),
          const SizedBox(
            height: 14,
          ),
          const SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            //untuk scrollabel widget
            child: Row(
              children: [
                HomeUserItem(
                  imageUrl: 'assets/images/img_friend1.png',
                  usernmae: 'Aisyah',
                ),
                HomeUserItem(
                  imageUrl: 'assets/images/img_friend2.png',
                  usernmae: 'Fatimah',
                ),
                HomeUserItem(
                  imageUrl: 'assets/images/img_friend3.png',
                  usernmae: 'Khotijah',
                ),
                HomeUserItem(
                  imageUrl: 'assets/images/img_friend4.png',
                  usernmae: 'Ayana ',
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget buildFriendtips() {
    return Container(
      margin: const EdgeInsets.only(
        top: 30,
        bottom: 50,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Friendly Tips',
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semiBlod,
            ),
          ),
          const SizedBox(
            height: 14,
          ),
          const Wrap(
            spacing: 29,
            runSpacing: 18,
            children: [
              HomeTipsItem(
                imageUrl: 'assets/images/img_tips1.png',
                title: 'Best buy a Car for familly',
                url: 'https://google.com',
              ),
              HomeTipsItem(
                imageUrl: 'assets/images/img_tips2.png',
                title: 'A Familly & children make food',
                url: 'https://youtube.com',
              ),
              HomeTipsItem(
                imageUrl: 'assets/images/img_tips3.png',
                title: 'Are your kidding me, Brother ',
                url: 'https://google.com',
              ),
              HomeTipsItem(
                imageUrl: 'assets/images/img_tips4.png',
                title: 'The car color is blue, That Bigger',
                url: 'https://google.com',
              )
            ],
          )
        ],
      ),
    );
  }
}
