import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stuna/models/user_model.dart';
import 'package:stuna/providers/auth_provider.dart';
import 'package:stuna/theme.dart';

class EditProfilPage extends StatelessWidget {
  const EditProfilPage({super.key});

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    UserModel user = authProvider.user;
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

    TextEditingController kelasIdController =
        TextEditingController(text: user.kelasId);

    handleEditProfile() async {
      if (await authProvider.editProfile(
        username: usernameController.text,
        fullName: nameController.text,
        namaPanggilan: namaPanggilanController.text,
        email: emailController.text,
        alamat: alamatController.text,
        noHp: noHpController.text,
        nim: nimController.text,
        kelasId: kelasIdController.text,
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
        Navigator.pushNamed(context, '/beranda');
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

    Widget kelasIdInput() {
      return Container(
        margin: EdgeInsets.only(top: defaultMargin),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            'Kelas ID',
            style: secondaryTextStyle.copyWith(
              fontSize: 12,
            ),
          ),
          TextFormField(
            style: primaryTextStyle,
            controller: kelasIdController,
            decoration: InputDecoration(
                hintText: 'Kelas Id Anda',
                hintStyle: secondaryTextStyle,
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: secondaryColor),
                )),
          )
        ]),
      );
    }

    Widget content() {
      return Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          horizontal: defaultMargin,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            nameInput(),
            namaPanggilanInput(),
            emailInput(),
            alamatInput(),
            noHpInput(),
            nimInput(),
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
