import 'package:flutter/material.dart';
import 'package:stuna/models/user_model.dart';
import 'package:stuna/services/auth_service.dart';

class AuthProvider with ChangeNotifier {
  late UserModel _user;

  UserModel get user => _user;

  set user(UserModel user) {
    _user = user;
    notifyListeners();
  }

  Future<bool> register(
      {String? name, String? username, String? email, String? password}) async {
    try {
      UserModel user = await AuthService().register(
        name: name,
        username: username,
        email: email,
        password: password,
      );

      _user = user;
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> login({String? username, String? password}) async {
    try {
      UserModel user = await AuthService().login(
        username: username,
        password: password,
      );

      _user = user;
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> editProfile({
    required String username,
    required String fullName,
    required String namaPanggilan,
    required String email,
    required String alamat,
    required String noHp,
    required String nim,
    required String kelasId,
    required String token,
  }) async {
    try {
      UserModel user = await AuthService().editProfile(
        username: username,
        fullName: fullName,
        namaPanggilan: namaPanggilan,
        email: email,
        alamat: alamat,
        noHp: noHp,
        nim: nim,
        kelasId: kelasId,
        token: token,
      );

      _user = user;

      return true;
    } catch (e) {
      print(e);

      return false;
    }
  }

  var result = true;

  Future<bool> logout(String token) async {
    try {
      if (await AuthService().logout(token)) {
        result = true;
      }
      return result;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
