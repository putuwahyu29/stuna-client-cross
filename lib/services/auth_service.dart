import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:stuna/models/user_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  String apiUrl = dotenv.env['API_URL'].toString();
  Future<UserModel> register(
      {String? name, String? username, String? email, String? password}) async {
    var url = Uri.parse('$apiUrl/auth/register');
    var headers = {'Content-Type': 'application/json'};
    var body = jsonEncode({
      'fullName': name,
      'username': username,
      'email': email,
      'password': password
    });

    var response = await http.post(
      url,
      headers: headers,
      body: body,
    );
    if (response.statusCode == 201) {
      var data = jsonDecode(response.body);
      UserModel user = UserModel.fromJson(data['user']);
      var token = user.token = 'Bearer${data['accessToken']}';
      final prefs = await SharedPreferences.getInstance();
      prefs.setString('username', username!);
      prefs.setString('password', password!);
      prefs.setString('token', token);
      return user;
    } else {
      throw Exception('Gagal Daftar');
    }
  }

  Future<UserModel> login({String? username, String? password}) async {
    var url = Uri.parse('$apiUrl/auth/login');
    var headers = {'Content-Type': 'application/json'};
    var body = jsonEncode({'username': username, 'password': password});
    var response = await http.post(
      url,
      headers: headers,
      body: body,
    );
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      UserModel user = UserModel.fromJson(data['user']);
      var token = user.token = 'Bearer${data['accessToken']}';
      var kelasId = user.kelasId;
      final prefs = await SharedPreferences.getInstance();
      prefs.setString('username', username!);
      prefs.setString('password', password!);
      prefs.setString('kelasId', kelasId.toString());
      prefs.setString('token', token);
      return user;
    } else {
      throw Exception('Gagal Masuk');
    }
  }

  Future<UserModel> editProfile({
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
    var url = '$apiUrl/user';
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': token,
    };
    var body = jsonEncode({
      'username': username,
      'fullName': fullName,
      'nama_panggilan': namaPanggilan,
      'email': email,
      'alamat': alamat,
      'no_hp': noHp,
      'nim': nim,
      'kelas_id': kelasId,
    });
    var response = await http.put(
      Uri.parse('$url/$username'),
      headers: headers,
      body: body,
    );
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      UserModel user = UserModel.fromJson(data['user']);
      user.token = token;
      final prefs = await SharedPreferences.getInstance();
      prefs.setString('username', username);
      return user;
    } else {
      throw Exception('Gagal Perbarui Profil');
    }
  }

  Future<bool> logout(String token) async {
    var url = Uri.parse('$apiUrl/auth/logout');
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': token,
    };

    var response = await http.post(
      url,
      headers: headers,
    );
    if (response.statusCode == 200) {
      final prefs = await SharedPreferences.getInstance();
      prefs.clear();
      // ignore: deprecated_member_use
      prefs.commit();
      return true;
    } else {
      throw Exception('Gagal Keluar');
    }
  }
}
