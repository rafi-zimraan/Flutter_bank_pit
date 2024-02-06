import 'package:bank_pit_bwa/shared/theme.dart';
import 'package:bank_pit_bwa/ui/widgets/forms.dart';
import 'package:bank_pit_bwa/ui/widgets/transfer_recent_user_item.dart';
import 'package:flutter/material.dart';

class TransferPage extends StatelessWidget {
  const TransferPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Transfer',
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
            'Search',
            style: blackTextStyle.copyWith(
              fontWeight: semiBlod,
              fontSize: 16,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          CustomFormField(
            title: 'by username',
            isShowTitle: false,
          ),
          buildRecentUsers(),
        ],
      ),
    );
  }

  Widget buildRecentUsers() {
    return Container(
      margin: const EdgeInsets.only(
        top: 40,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Search',
            style: blackTextStyle.copyWith(
              fontWeight: semiBlod,
              fontSize: 16,
            ),
          ),
          const SizedBox(
            height: 14,
          ),
          const TransferRecentUserItem(
            imgUrl: 'assets/images/img_friend1.png',
            name: 'Ayuntari Sekar',
            username: 'Sekar',
            isVerified: false,
          ),
          const TransferRecentUserItem(
            imgUrl: 'assets/images/img_friend2.png',
            name: 'Mahendra Ningsih',
            username: 'hendra',
            isVerified: true,
          ),
          const TransferRecentUserItem(
            imgUrl: 'assets/images/img_friend3.png',
            name: 'Pamulang Diningrat',
            username: 'Lanang',
            isVerified: false,
          ),
        ],
      ),
    );
  }
}
