import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stuna/models/pengumuman_model.dart';
import 'package:stuna/pages/pengumuman_page.dart';
import 'package:stuna/providers/berbintang_provider.dart';
import 'package:stuna/theme.dart';

class BerbintangCard extends StatelessWidget {
  final PengumumanModel pengumuman;
  BerbintangCard(this.pengumuman);

  @override
  Widget build(BuildContext context) {
    BerbintangProvider berbintangProvider =
        Provider.of<BerbintangProvider>(context);
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
          margin: const EdgeInsets.only(
            top: 20,
          ),
          padding: const EdgeInsets.only(
            top: 10,
            left: 12,
            bottom: 14,
            right: 20,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: backgroundColorHeaderAndNav,
          ),
          child: Row(children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                pengumuman.gambar!,
                width: 120,
                height: 120,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              width: 12,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    pengumuman.judul,
                    style: whiteTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: semiBold,
                    ),
                    maxLines: 2,
                  ),
                  Text(
                    pengumuman.excerpt,
                    style: whiteTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: medium,
                    ),
                    maxLines: 3,
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                berbintangProvider.setPengumuman(pengumuman);
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    backgroundColor: alertColor,
                    content: const Text(
                      'Telah dihapus dari Pengumuman Berbintang',
                      textAlign: TextAlign.center,
                    )));
              },
              child: Image.asset(
                'assets/button_star_blue.png',
                width: 34,
              ),
            ),
          ]),
        ));
  }
}
