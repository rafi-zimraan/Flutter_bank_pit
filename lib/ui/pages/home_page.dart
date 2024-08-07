import 'package:bank_pit_bwa/blocs/auth/auth_bloc.dart';
import 'package:bank_pit_bwa/shared/shared_methods.dart';
import 'package:bank_pit_bwa/shared/theme.dart';
import 'package:bank_pit_bwa/ui/widgets/home_latest_transaction_item.dart';
import 'package:bank_pit_bwa/ui/widgets/home_service_item.dart';
import 'package:bank_pit_bwa/ui/widgets/home_tips_item.dart';
import 'package:bank_pit_bwa/ui/widgets/home_user_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
          buildServices(context),
          buildLatestTransactions(),
          buildSendAgain(),
          buildFriendtips(),
        ],
      ),
    );
  }

  Widget buildProfile(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is AuthSuccess) {
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
                      state.user.username.toString(),
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
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: state.user.profilePicture == null
                            ? const AssetImage(
                                'assets/images/img_profile.png',
                              )
                            : NetworkImage(state.user.profilePicture!)
                                as ImageProvider,
                      ),
                    ),
                    child: state.user.verified == 1
                        ? Align(
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
                          )
                        : null,
                  ),
                )
              ],
            ),
          );
        }
        return Container();
      },
    );
  }

  Widget buildWalletCard() {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is AuthSuccess) {
          return Container(
            width: double.infinity,
            height: 220,
            margin: const EdgeInsets.only(
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
                  state.user.name.toString(),
                  style: whiteTextStyle.copyWith(
                    fontSize: 18,
                    fontWeight: medium,
                  ),
                ),
                const SizedBox(
                  height: 3,
                ),
                Text(
                  '**** **** **** ${state.user.cardNumber!.substring(12, 16)}',
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
                  formatCurrency(state.user.balance ?? 0),
                  style: whiteTextStyle.copyWith(
                    fontSize: 24,
                    fontWeight: semiBlod,
                  ),
                )
              ],
            ),
          );
        }
        return Container();
      },
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
                'of ${formatCurrency(40000)}',
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

  Widget buildServices(BuildContext context) {
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
                ontap: () {
                  Navigator.pushNamed(context, '/topup');
                },
              ),
              HomeServiceItem(
                iconUrl: 'assets/icons/ic_send.png',
                title: 'Send',
                ontap: () {
                  Navigator.pushNamed(context, '/tranfer');
                },
              ),
              HomeServiceItem(
                iconUrl: 'assets/icons/ic_withdraw.png',
                title: 'Withrad',
                ontap: () {},
              ),
              HomeServiceItem(
                iconUrl: 'assets/icons/ic_more.png',
                title: 'More',
                ontap: () {
                  showDialog(
                    context: context,
                    builder: (context) => const MoreDialog(),
                  );
                },
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HomeLatestTransactionItem(
                  iconUrl: 'assets/icons/ic_transaction_cat1.png',
                  title: 'Top Up',
                  time: 'Yesterday',
                  value: '+ ${formatCurrency(50000, symbol: '')}',
                ),
                HomeLatestTransactionItem(
                  iconUrl: 'assets/icons/ic_transaction_cat2.png',
                  title: 'Chasback',
                  time: 'Mey 19',
                  value: '+ ${formatCurrency(980000, symbol: '')}',
                ),
                HomeLatestTransactionItem(
                  iconUrl: 'assets/icons/ic_transaction_cat3.png',
                  title: 'Withdraw',
                  time: 'Jan 22',
                  value: '+ ${formatCurrency(19000, symbol: '')}',
                ),
                HomeLatestTransactionItem(
                  iconUrl: 'assets/icons/ic_transaction_cat4.png',
                  title: 'Transfer',
                  time: 'Juli 10',
                  value: '+ ${formatCurrency(30000, symbol: '')}',
                ),
                HomeLatestTransactionItem(
                  iconUrl: 'assets/icons/ic_transaction_cat5.png',
                  title: 'Electric',
                  time: 'Maret 1',
                  value: '+ ${formatCurrency(89970, symbol: '')}',
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

class MoreDialog extends StatelessWidget {
  const MoreDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.zero,
      alignment: Alignment.bottomCenter,
      content: Container(
        height: 326,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(30),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          color: lightBackgroundColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Do More With Us',
              style: blackTextStyle.copyWith(
                fontSize: 16,
                fontWeight: semiBlod,
              ),
            ),
            const SizedBox(
              height: 13,
            ),
            Wrap(
              spacing: 29,
              runSpacing: 25,
              children: [
                HomeServiceItem(
                  iconUrl: 'assets/icons/ic_product_data.png',
                  title: 'Data',
                  ontap: () {
                    Navigator.pushNamed(context, '/data-provider');
                  },
                ),
                HomeServiceItem(
                  iconUrl: 'assets/icons/ic_product_water.png',
                  title: 'Water',
                  ontap: () {},
                ),
                HomeServiceItem(
                  iconUrl: 'assets/icons/ic_product_stream.png',
                  title: 'Stream',
                  ontap: () {},
                ),
                HomeServiceItem(
                  iconUrl: 'assets/icons/ic_product_movie.png',
                  title: 'Movie',
                  ontap: () {},
                ),
                HomeServiceItem(
                  iconUrl: 'assets/icons/ic_product_food.png',
                  title: 'Food',
                  ontap: () {},
                ),
                HomeServiceItem(
                  iconUrl: 'assets/icons/ic_product_travel.png',
                  title: 'Travel',
                  ontap: () {},
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
