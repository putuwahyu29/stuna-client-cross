import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stuna/models/user_model.dart';
import 'package:stuna/models/kelas_model.dart';
import 'package:stuna/providers/auth_provider.dart';
import 'package:stuna/providers/kelas_provider.dart';
import 'package:stuna/theme.dart';

class EditProfilPage extends StatelessWidget {
  const EditProfilPage({super.key});

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    UserModel user = authProvider.user;
    KelasProvider kelasProvider = Provider.of<KelasProvider>(context);
    int valueDropdown;
    if (user.kelasId == null) {
      valueDropdown = 0;
    } else {
      valueDropdown = int.parse(user.kelasId.toString());
    }
    TextEditingController usernameController =
        TextEditingController(text: user.username);

    TextEditingController nameController =
        TextEditingController(text: user.fullName);

    TextEditingController namaPanggilanController =
        TextEditingController(text: user.namaPanggilan);

    TextEditingController emailController =
        TextEditingController(text: user.email);

    TextEditingController alamatController =
        TextEditingController(text: user.alamat);

    TextEditingController noHpController =
        TextEditingController(text: user.noHp);

    TextEditingController nimController = TextEditingController(text: user.nim);

    String kelasIdController = user.kelasId.toString();

    handleEditProfile() async {
      if (await authProvider.editProfile(
        username: usernameController.text,
        fullName: nameController.text,
        namaPanggilan: namaPanggilanController.text,
        email: emailController.text,
        alamat: alamatController.text,
        noHp: noHpController.text,
        nim: nimController.text,
        kelasId: kelasIdController,
        token: authProvider.user.token!,
      )) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: infoColor,
            content: const Text(
              'Berhasil Perbarui Profil',
              textAlign: TextAlign.center,
            ),
          ),
        );
        Navigator.pushNamed(context, '/');
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: alertColor,
            content: const Text(
              'Gagal Perbarui Profil!',
              textAlign: TextAlign.center,
            ),
          ),
        );
      }
    }

    header() {
      return AppBar(
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: backgroundColorHeaderAndNav,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Edit Profil',
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.check,
              color: whiteTextColor,
            ),
            onPressed: handleEditProfile,
          )
        ],
      );
    }

    Widget usernameInput() {
      return Container(
        margin: EdgeInsets.only(top: defaultMargin),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            'Nama Pengguna',
            style: secondaryTextStyle.copyWith(
              fontSize: 12,
            ),
          ),
          TextFormField(
            style: primaryTextStyle,
            controller: usernameController,
            decoration: InputDecoration(
                hintText: 'Nama Pengguna Anda',
                hintStyle: secondaryTextStyle,
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: secondaryColor),
                )),
          )
        ]),
      );
    }

    Widget nameInput() {
      return Container(
        margin: EdgeInsets.only(top: defaultMargin),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            'Nama Lengkap',
            style: secondaryTextStyle.copyWith(
              fontSize: 12,
            ),
          ),
          TextFormField(
            style: primaryTextStyle,
            controller: nameController,
            decoration: InputDecoration(
                hintText: 'Nama Lengkap Anda',
                hintStyle: secondaryTextStyle,
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: secondaryColor),
                )),
          )
        ]),
      );
    }

    Widget namaPanggilanInput() {
      return Container(
        margin: EdgeInsets.only(top: defaultMargin),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            'Nama Panggilan',
            style: secondaryTextStyle.copyWith(
              fontSize: 12,
            ),
          ),
          TextFormField(
            style: primaryTextStyle,
            controller: namaPanggilanController,
            decoration: InputDecoration(
                hintText: 'Nama Panggilan Anda',
                hintStyle: secondaryTextStyle,
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: secondaryColor),
                )),
          )
        ]),
      );
    }

    Widget emailInput() {
      return Container(
        margin: EdgeInsets.only(top: defaultMargin),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            'Alamat Email',
            style: secondaryTextStyle.copyWith(
              fontSize: 12,
            ),
          ),
          TextFormField(
            style: primaryTextStyle,
            controller: emailController,
            decoration: InputDecoration(
                hintText: 'Alamat Email Anda',
                hintStyle: secondaryTextStyle,
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: secondaryColor),
                )),
          )
        ]),
      );
    }

    Widget alamatInput() {
      return Container(
        margin: EdgeInsets.only(top: defaultMargin),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            'Alamat Kos',
            style: secondaryTextStyle.copyWith(
              fontSize: 12,
            ),
          ),
          TextFormField(
            style: primaryTextStyle,
            controller: alamatController,
            decoration: InputDecoration(
                hintText: 'Alamat Kos Anda',
                hintStyle: secondaryTextStyle,
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: secondaryColor),
                )),
          )
        ]),
      );
    }

    Widget noHpInput() {
      return Container(
        margin: EdgeInsets.only(top: defaultMargin),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            'No Handphone',
            style: secondaryTextStyle.copyWith(
              fontSize: 12,
            ),
          ),
          TextFormField(
            style: primaryTextStyle,
            controller: noHpController,
            decoration: InputDecoration(
                hintText: 'No Handphone Anda',
                hintStyle: secondaryTextStyle,
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: secondaryColor),
                )),
          )
        ]),
      );
    }

    Widget nimInput() {
      return Container(
        margin: EdgeInsets.only(top: defaultMargin),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            'NIM',
            style: secondaryTextStyle.copyWith(
              fontSize: 12,
            ),
          ),
          TextFormField(
            style: primaryTextStyle,
            controller: nimController,
            decoration: InputDecoration(
                hintText: 'NIM Anda',
                hintStyle: secondaryTextStyle,
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: secondaryColor),
                )),
          )
        ]),
      );
    }

    Widget kelasInput() {
      return Container(
        margin: EdgeInsets.only(top: defaultMargin),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            'Kelas',
            style: secondaryTextStyle.copyWith(
              fontSize: 12,
            ),
          ),
          DropdownButtonFormField(
              value: valueDropdown,
              items: kelasProvider.kelas.map((kelas) {
                return DropdownMenuItem(
                  child: Text(kelas.namaKelas),
                  value: kelas.id,
                );
              }).toList(),
              onChanged: (value) => kelasIdController = value.toString()),
        ]),
      );
    }

    Widget content() {
      return SingleChildScrollView(
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.symmetric(
          horizontal: defaultMargin,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 100,
              height: 100,
              margin: EdgeInsets.only(top: defaultMargin),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(
                      user.profilePhotoUrl,
                    )),
              ),
            ),
            nameInput(),
            namaPanggilanInput(),
            emailInput(),
            alamatInput(),
            noHpInput(),
            nimInput(),
            kelasInput(),
            SizedBox(
              height: 300,
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: backgroundColorFull,
      appBar: header(),
      body: content(),
      resizeToAvoidBottomInset: false,
    );
  }
}
