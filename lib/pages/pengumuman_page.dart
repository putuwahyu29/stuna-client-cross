import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stuna/models/pengumuman_model.dart';
import 'package:stuna/providers/berbintang_provider.dart';
import 'package:stuna/theme.dart';
import 'package:intl/intl.dart';

class PengumumanPage extends StatefulWidget {
  final PengumumanModel pengumuman;
  const PengumumanPage(this.pengumuman, {super.key});

  @override
  State<PengumumanPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<PengumumanPage> {
  int currentIndex = 0;
  bool isWishList = false;

  @override
  Widget build(BuildContext context) {
    BerbintangProvider berbintangProvider =
        Provider.of<BerbintangProvider>(context);


    Widget header() {

      return Column(
        children: [
          Container(
            margin: EdgeInsets.only(
              top: 20,
              left: defaultMargin,
              right: defaultMargin,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.chevron_left,
                  ),
                ),
              ],
            ),
          ),
          Image.network(
            widget.pengumuman.gambar!,
            width: MediaQuery.of(context).size.width,
            height: 410,
            fit: BoxFit.cover,
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      );
    }

    Widget content() {

      return Container(
        width: double.infinity,
        margin: const EdgeInsets.only(
          top: 0,
        ),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(24),
          ),
          color: backgroundColorFull,
        ),
        child: Column(children: [
          Container(
            margin: EdgeInsets.only(
              top: defaultMargin,
              left: defaultMargin,
              right: defaultMargin,
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.pengumuman.judul,
                        style: primaryTextStyle.copyWith(
                          fontSize: 20,
                          fontWeight: semiBold,
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    berbintangProvider.setPengumuman(widget.pengumuman);
                    if (berbintangProvider.isBerbintang(widget.pengumuman)) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          backgroundColor: infoColor,
                          content: const Text(
                            'Telah ditambahkan ke Pengumuman Berbintang',
                            textAlign: TextAlign.center,
                          )));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          backgroundColor: alertColor,
                          content: const Text(
                            'Telah dihapus dari Pengumuman Berbintang',
                            textAlign: TextAlign.center,
                          )));
                    }
                  },
                  child: Image.asset(
                    berbintangProvider.isBerbintang(widget.pengumuman)
                        ? 'assets/button_star_blue.png'
                        : 'assets/button_star.png',
                    width: 46,
                  ),
                )
              ],
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(
              top: defaultMargin,
              left: defaultMargin,
              right: defaultMargin,
            ),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                'Diperbarui pada',
                style: primaryTextStyle.copyWith(
                  fontWeight: semiBold,
                  fontSize: 16,
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Text(
                DateFormat('dd-MM-yyyy')
                    .format(widget.pengumuman.updatedAt)
                    .toString(),
                style: primaryTextStyle.copyWith(
                  fontWeight: light,
                  fontSize: 14,
                ),
                textAlign: TextAlign.justify,
              )
            ]),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(
                top: defaultMargin,
                left: defaultMargin,
                right: defaultMargin,
                bottom: 30),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                'Isi Pengumuman',
                style: primaryTextStyle.copyWith(
                  fontWeight: semiBold,
                  fontSize: 16,
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Text(
                widget.pengumuman.isi,
                style: primaryTextStyle.copyWith(
                  fontWeight: light,
                  fontSize: 14,
                ),
                textAlign: TextAlign.justify,
              ),
              const SizedBox(
                height: 20,
              ),
            ]),
          ),
        ]),
      );
    }

    return Scaffold(
        backgroundColor: backgroundColorFull,
        body: ListView(
          children: [
            header(),
            content(),
          ],
        ));
  }
}
