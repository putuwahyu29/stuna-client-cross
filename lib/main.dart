import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stuna/pages/lihat_profil_page.dart';
import 'package:stuna/pages/edit_profil_page.dart';
import 'package:stuna/pages/home/main_page.dart';
import 'package:stuna/pages/masuk_page.dart';
import 'package:stuna/pages/daftar_page.dart';
import 'package:stuna/pages/splash_page.dart';
import 'package:stuna/providers/auth_provider.dart';
import 'package:stuna/providers/page_provider.dart';
import 'package:stuna/providers/pengumuman_provider.dart';
import 'package:stuna/providers/berbintang_provider.dart';
import 'package:stuna/providers/kelas_provider.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> main() async {
  await dotenv.load(fileName: ".env");
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => PengumumanProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => KelasProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => BerbintangProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => PageProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => const SplashPage(),
          '/masuk': (context) => const MasukPage(),
          '/daftar': (context) => const DaftarPage(),
          '/beranda': (context) => const MainPage(),
          '/edit-profil': (context) => const EditProfilPage(),
          '/lihat-profil': (context) => const LihatProfilPage(),
        },
      ),
    );
  }
}
