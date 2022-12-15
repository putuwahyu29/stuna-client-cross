import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stuna/models/user_model.dart';
import 'package:stuna/providers/auth_provider.dart';
import 'package:stuna/providers/pengumuman_provider.dart';
import 'package:stuna/theme.dart';
import 'package:stuna/widgets/pengumuman_card.dart';
import 'package:stuna/widgets/pengumuman_tile.dart';

class BerandaPage extends StatelessWidget {
  const BerandaPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    UserModel user = authProvider.user;
    PengumumanProvider pengumumanProvider =
        Provider.of<PengumumanProvider>(context);

    Widget header() {
      return Container(
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
                    'Halo, ${user.fullName}',
                    style: primaryTextStyle.copyWith(
                      fontSize: 24,
                      fontWeight: semiBold,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    '@${user.username}',
                    style: primaryTextStyle.copyWith(
                      fontSize: 16,
                    ),
                  )
                ],
              ),
            ),
            GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/edit-profil');
                },
                child: Container(
                  width: 54,
                  height: 54,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: NetworkImage(
                        user.profilePhotoUrl,
                      ),
                    ),
                  ),
                ))
          ],
        ),
      );
    }

    Widget judulPengumuman() {
      return Container(
        margin: EdgeInsets.only(
          top: defaultMargin,
          left: defaultMargin,
          right: defaultMargin,
        ),
        child: Text(
          'Pengumuman Terbaru',
          style: primaryTextStyle.copyWith(
            fontSize: 22,
            fontWeight: semiBold,
          ),
        ),
      );
    }

    Widget pengumumanLimit() {
      return Container(
        margin: const EdgeInsets.only(
          top: 14,
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              SizedBox(
                width: defaultMargin,
              ),
              Row(
                children: pengumumanProvider.pengumumanLimit
                    .map(
                      (pengumumanLimit) => PengumumanCard(pengumumanLimit),
                    )
                    .toList(),
              ),
            ],
          ),
        ),
      );
    }

    Widget judulPengumumanSemua() {
      return Container(
        margin: EdgeInsets.only(
          top: defaultMargin,
          left: defaultMargin,
          right: defaultMargin,
        ),
        child: Text(
          'Semua Pengumuman',
          style: primaryTextStyle.copyWith(
            fontSize: 22,
            fontWeight: semiBold,
          ),
        ),
      );
    }

    Widget pengumumanSemua() {
      return Container(
        margin: const EdgeInsets.only(
          top: 14,
        ),
        child: Column(
          children: pengumumanProvider.pengumumanSemua
              .map(
                (pengumumanSemua) => PengumumanTile(pengumumanSemua),
              )
              .toList(),
        ),
      );
    }

    return ListView(
      children: [
        header(),
        judulPengumuman(),
        pengumumanLimit(),
        judulPengumumanSemua(),
        pengumumanSemua(),
      ],
    );
  }
}
