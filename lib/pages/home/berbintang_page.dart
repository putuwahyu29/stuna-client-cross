import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stuna/providers/page_provider.dart';
import 'package:stuna/providers/berbintang_provider.dart';
import 'package:stuna/theme.dart';
import 'package:stuna/widgets/berbintang_card.dart';

class BerbintangPage extends StatelessWidget {
  const BerbintangPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BerbintangProvider berbintangProvider =
        Provider.of<BerbintangProvider>(context);
    PageProvider pageProvider = Provider.of<PageProvider>(context);

    Widget header() {
      return AppBar(
        backgroundColor: backgroundColorHeaderAndNav,
        centerTitle: true,
        title: const Text(
          'Pengumuman Berbintang',
        ),
        elevation: 0,
        automaticallyImplyLeading: false,
      );
    }

    Widget emptyStarred() {
      return Expanded(
        child: Container(
          width: double.infinity,
          color: backgroundColorButton,
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Image.asset(
              'assets/image_star.png',
              width: 74,
            ),
            const SizedBox(
              height: 23,
            ),
            Text(
              "Tidak ada pengumuman berbintang?",
              style:
                  primaryTextStyle.copyWith(fontSize: 16, fontWeight: medium),
            ),
            const SizedBox(
              height: 12,
            ),
            Text(
              "Ayo temukan pengumuman",
              style: secondaryTextStyle,
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 44,
              child: TextButton(
                style: TextButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 24,
                    ),
                    backgroundColor: primaryColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12))),
                onPressed: () {
                  pageProvider.currentIndex = 0;
                },
                child: Text(
                  'Jelajahi Pengumuman',
                  style: whiteTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: medium,
                  ),
                ),
              ),
            )
          ]),
        ),
      );
    }

    Widget content() {
      return Expanded(
        child: Container(
          color: backgroundColorFull,
          child: ListView(
            padding: EdgeInsets.symmetric(
              horizontal: defaultMargin,
            ),
            children: berbintangProvider.berbintang
                .map(
                  (pengumuman) => BerbintangCard(pengumuman),
                )
                .toList(),
          ),
        ),
      );
    }

    return Column(
      children: [
        header(),
        berbintangProvider.berbintang.isEmpty ? emptyStarred() : content(),
      ],
    );
  }
}
