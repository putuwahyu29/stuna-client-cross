import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stuna/models/user_model.dart';
import 'package:stuna/providers/auth_provider.dart';
import 'package:stuna/theme.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfilPage extends StatefulWidget {
  const ProfilPage({super.key});

  @override
  State<ProfilPage> createState() => _ProfilPageState();
}

bool isLoading = false;

class _ProfilPageState extends State<ProfilPage> {
  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    UserModel user = authProvider.user;

    handleLogout() async {
      setState(() {
        isLoading = true;
      });

      if (await authProvider.logout(user.token!)) {
        SystemNavigator.pop();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: alertColor,
            content: const Text(
              'Gagal Keluar!',
              textAlign: TextAlign.center,
            )));
      }

      setState(() {
        isLoading = false;
      });
    }

    confirmButtonLogout() {
      return SizedBox(
        width: 100,
        height: 44,
        child: TextButton(
          onPressed: handleLogout,
          style: TextButton.styleFrom(
              backgroundColor: primaryColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              isLoading
                  ? SizedBox(
                      width: 12,
                      height: 12,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        valueColor: AlwaysStoppedAnimation(
                          primaryTextColor,
                        ),
                      ),
                    )
                  : const SizedBox(
                      width: 0,
                    ),
              SizedBox(
                width: isLoading ? -5 : 5,
              ),
              Text(
                isLoading ? 'Tunggu' : 'Iya',
                style: whiteTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: medium,
                ),
              ),
            ],
          ),
        ),
      );
    }

    Future<void> showLogoutDialog() async {
      return showDialog(
        context: context,
        builder: (BuildContext context) => SizedBox(
          width: MediaQuery.of(context).size.width - (2 * defaultMargin),
          child: AlertDialog(
            backgroundColor: backgroundColorInput,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            content: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    width: 300,
                    child: Icon(
                      Icons.logout,
                      color: primaryTextColor,
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Text(
                    'Apakah Anda Yakin Untuk Keluar Akun dan Aplikasi?',
                    style: primaryTextStyle.copyWith(
                      fontSize: 18,
                      fontWeight: semiBold,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      confirmButtonLogout(),
                      const SizedBox(
                        width: 12,
                      ),
                      SizedBox(
                        width: 100,
                        height: 44,
                        child: TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          style: TextButton.styleFrom(
                              backgroundColor: backgroundColorButton,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12))),
                          child: Text(
                            'Batal',
                            textAlign: TextAlign.center,
                            style: primaryTextStyle.copyWith(
                              fontSize: 16,
                              fontWeight: medium,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }

    Widget header() {
      return AppBar(
        backgroundColor: backgroundColorHeaderAndNav,
        automaticallyImplyLeading: false,
        elevation: 0,
        flexibleSpace: SafeArea(
          child: Container(
            padding: EdgeInsets.all(defaultMargin),
            child: Row(children: [
              ClipOval(
                child: Image.network(
                  user.profilePhotoUrl,
                  width: 64,
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    user.fullName,
                    style: whiteTextStyle.copyWith(
                      fontSize: 24,
                      fontWeight: semiBold,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    '@${user.username}',
                    style: whiteTextStyle.copyWith(
                      fontSize: 16,
                    ),
                  )
                ],
              )),
              GestureDetector(
                // onTap: handleLogout,
                onTap: () {
                  showLogoutDialog();
                },
                child: Image.asset(
                  'assets/button_exit.png',
                  width: 20,
                ),
              )
            ]),
          ),
        ),
      );
    }

    Widget menuItem(String text) {
      return Container(
          margin: const EdgeInsets.only(top: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                text,
                style: secondaryTextStyle.copyWith(
                  fontSize: 13,
                ),
              ),
              Icon(
                Icons.chevron_right,
                color: primaryTextColor,
              ),
            ],
          ));
    }

    Widget content() {
      return Expanded(
          child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: defaultMargin,
        ),
        width: double.infinity,
        decoration: BoxDecoration(color: backgroundColorFull),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            Text(
              'Akun Saya',
              style: primaryTextStyle.copyWith(
                fontSize: 16,
                fontWeight: semiBold,
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/lihat-profil');
              },
              child: menuItem('Lihat Profil'),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/edit-profil');
              },
              child: menuItem('Ubah Profil'),
            ),
            // buat menu untuk membuka link pada external browser dengan package url_launcher
            GestureDetector(
              onTap: () async {
                final Uri url = Uri.parse('https://wa.me/6281917803898');
                if (!await launchUrl(url)) {
                  throw 'Could not launch $url';
                }
              },
              child: menuItem('Bantuan'),
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              'Umum',
              style: primaryTextStyle.copyWith(
                fontSize: 16,
                fontWeight: semiBold,
              ),
            ),
            GestureDetector(
              onTap: () async {
                final Uri url = Uri.parse('https://agus-stuna.vercel.app');
                if (!await launchUrl(url)) {
                  throw 'Could not launch $url';
                }
              },
              child: menuItem('Stuna Web'),
            ),
            GestureDetector(
              onTap: () async {
                final Uri url =
                    Uri.parse('https://222011460.student.stis.ac.id');
                if (!await launchUrl(url)) {
                  throw 'Could not launch $url';
                }
              },
              child: menuItem('Stuna Api'),
            ),
          ],
        ),
      ));
    }

    return Column(
      children: [
        header(),
        content(),
      ],
    );
  }
}
