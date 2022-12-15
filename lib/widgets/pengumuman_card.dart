import 'package:flutter/material.dart';
import 'package:stuna/models/pengumuman_model.dart';
import 'package:stuna/pages/pengumuman_page.dart';
import 'package:stuna/theme.dart';
import 'package:intl/intl.dart';

class PengumumanCard extends StatelessWidget {
  final PengumumanModel pengumuman;
  PengumumanCard(this.pengumuman);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PengumumanPage(pengumuman),
          ),
        );
      },
      child: Container(
        width: 215,
        height: 350,
        margin: EdgeInsets.only(
          right: defaultMargin,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: const Color(0xffECEDEF),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 25,
            ),
            Image.network(
              pengumuman.gambar!,
              width: 215,
              height: 180,
              fit: BoxFit.cover,
            ),
            Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 6,
                  ),
                  Text(
                    pengumuman.judul!,
                    style: primaryTextStyle.copyWith(
                      fontSize: 18,
                      fontWeight: semiBold,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Text(pengumuman.excerpt!,
                      style: primaryTextStyle.copyWith(
                          fontSize: 16, fontWeight: medium),
                      maxLines: 2),
                  const SizedBox(
                    height: 12,
                  ),
                  Text(
                    "\Diperbarui pada ${DateFormat('dd-MM-yyyy').format(pengumuman.updatedAt!).toString()}",
                    style: primaryTextStyle.copyWith(
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
