import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:stuna/models/pengumuman_model.dart';

class PengumumanService {
  String apiUrl = dotenv.env['API_URL'].toString();

  Future<List<PengumumanModel>> getPengumumanByKelasIdLimit(
      {required String kelasId}) async {
    var url = '$apiUrl/pengumuman/limit/$kelasId';
    var headers = {'Content-Type': 'application/json'};

    var response = await http.get(Uri.parse(url), headers: headers);
    if (response.statusCode == 200) {
      List data = jsonDecode(response.body);
      List<PengumumanModel> pengumumanLimit = [];
      for (var item in data) {
        pengumumanLimit.add(PengumumanModel.fromJson(item));
      }
      return pengumumanLimit;
    } else {
      throw Exception('Gagal Mendapatkan Data Produk!');
    }
  }

  Future<List<PengumumanModel>> getPengumumanByKelasId(
      {required String kelasId}) async {
    var url = '$apiUrl/pengumuman/$kelasId';
    var headers = {'Content-Type': 'application/json'};
    var response = await http.get(Uri.parse(url), headers: headers);
    if (response.statusCode == 200) {
      List data = jsonDecode(response.body);
      List<PengumumanModel> pengumumanSemua = [];
      for (var item in data) {
        pengumumanSemua.add(PengumumanModel.fromJson(item));
      }
      return pengumumanSemua;
    } else {
      throw Exception('Gagal Mendapatkan Data Produk!');
    }
  }
}
