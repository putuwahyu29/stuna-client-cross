import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stuna/providers/auth_provider.dart';
import 'package:stuna/providers/pengumuman_provider.dart';
import 'package:stuna/providers/kelas_provider.dart';
import 'package:stuna/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    getInit();

    super.initState();
  }

  getInit() async {
    sessionCheck();
  }

  Future pengumumanCheck(kelasId) async {
    await Provider.of<PengumumanProvider>(context, listen: false)
        .getPengumumanByKelasIdLimit(kelasId);
    await Provider.of<PengumumanProvider>(context, listen: false)
        .getPengumumanByKelasId(kelasId);
    Navigator.pushNamed(context, '/beranda');
  }

  Future sessionCheck() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final username = sharedPreferences.getString('username');
    final password = sharedPreferences.getString('password');
    var kelasId = sharedPreferences.getString('kelasId');
    final token = sharedPreferences.getString('token');
    if (token != null) {
      await Provider.of<AuthProvider>(context, listen: false)
          .login(username: username, password: password);
      await Provider.of<KelasProvider>(context, listen: false).getAllKelas();
      pengumumanCheck(kelasId);
    } else {
      Navigator.pushNamed(context, '/masuk');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColorFull,
      body: Center(
        child: Container(
          width: 130,
          height: 150,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/image_splash.png'),
            ),
          ),
        ),
      ),
    );
  }
}
