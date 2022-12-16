import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stuna/pages/home/beranda_page.dart';
import 'package:stuna/pages/home/profil_page.dart';
import 'package:stuna/pages/home/berbintang_page.dart';
import 'package:stuna/providers/page_provider.dart';
import 'package:stuna/theme.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    PageProvider pageProvider = Provider.of<PageProvider>(context);

    Widget customBottomNav() {
      return ClipRRect(
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(30),
        ),
        child: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          notchMargin: 8,
          clipBehavior: Clip.antiAlias,
          child: BottomNavigationBar(
            backgroundColor: backgroundColorHeaderAndNav,
            currentIndex: pageProvider.currentIndex,
            onTap: (value) {
              print(value);
              pageProvider.currentIndex = value;
            },
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                icon: Container(
                  margin: const EdgeInsets.only(
                    top: 21,
                    bottom: 5,
                  ),
                  child: Image.asset(
                    'assets/icon_home.png',
                    width: 20,
                    color: pageProvider.currentIndex == 0
                        ? const Color(0xFF000000)
                        : const Color(0xff808191),
                  ),
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Container(
                  margin: const EdgeInsets.only(
                    top: 21,
                    bottom: 5,
                  ),
                  child: Image.asset(
                    'assets/icon_star.png',
                    width: 20,
                    color: pageProvider.currentIndex == 1
                        ? const Color(0xFF000000)
                        : const Color(0xff808191),
                  ),
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Container(
                  margin: const EdgeInsets.only(
                    top: 21,
                    bottom: 5,
                  ),
                  child: Image.asset(
                    'assets/icon_profile.png',
                    width: 18,
                    color: pageProvider.currentIndex == 2
                        ? const Color(0xFF000000)
                        : const Color(0xff808191),
                  ),
                ),
                label: '',
              ),
            ],
          ),
        ),
      );
    }

    Widget body() {
      switch (pageProvider.currentIndex) {
        case 0:
          return const BerandaPage();
        case 1:
          return const BerbintangPage();
        case 2:
          return const ProfilPage();
        default:
          return const BerandaPage();
      }
    }

    return Scaffold(
      backgroundColor: pageProvider.currentIndex == 0
          ? backgroundColorButton
          : backgroundColorButton,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: customBottomNav(),
      body: body(),
    );
  }
}
