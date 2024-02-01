import 'package:bank_pit_bwa/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeTipsItem extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String url;
  const HomeTipsItem(
      {Key? key,
      required this.imageUrl,
      required this.title,
      required this.url})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await _launchURL(url);
      },
      child: Container(
        width: 155,
        height: 176,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: whiteColor,
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              child: Image.asset(
                imageUrl,
                width: 155,
                height: 110,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Text(
                title,
                style: blackTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: semiBlod,
                  overflow: TextOverflow.ellipsis,
                ),
                maxLines: 2,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $url';
    }
  }
}
