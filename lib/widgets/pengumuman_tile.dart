import 'package:flutter/material.dart';
import 'package:stuna/models/pengumuman_model.dart';
import 'package:stuna/pages/pengumuman_page.dart';
import 'package:stuna/theme.dart';
import 'package:intl/intl.dart';

class PengumumanTile extends StatelessWidget {
  final PengumumanModel pengumuman;
  PengumumanTile(this.pengumuman);

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
        margin: EdgeInsets.only(
          left: defaultMargin,
          right: defaultMargin,
          bottom: defaultMargin,
        ),
        child: Row(children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
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
                  style: primaryTextStyle.copyWith(
                    fontSize: 18,
                    fontWeight: semiBold,
                  ),
                  maxLines: 2,
                ),
                const SizedBox(
                  height: 6,
                ),
                Text(
                  pengumuman.excerpt,
                  style: primaryTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: medium,
                  ),
                  maxLines: 2,
                ),
                const SizedBox(
                  height: 6,
                ),
                Text(
                  "\Diperbarui pada ${DateFormat('dd-MM-yyyy').format(pengumuman.updatedAt).toString()}",
                  style: primaryTextStyle.copyWith(
                    fontSize: 12,
                    fontWeight: medium,
                  ),
                )
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
