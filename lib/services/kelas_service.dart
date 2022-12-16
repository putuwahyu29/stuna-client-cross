import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:stuna/models/kelas_model.dart';

class KelasService {
  String apiUrl = dotenv.env['API_URL'].toString();

  Future<List<KelasModel>> getAllKelas() async {
    var url = '$apiUrl/kelas';
    var headers = {'Content-Type': 'application/json'};

    var response = await http.get(Uri.parse(url), headers: headers);
    if (response.statusCode == 200) {
      List data = jsonDecode(response.body);
      
      List<KelasModel> kelas = [];
      for (var item in data) {
        kelas.add(KelasModel.fromJson(item));
      }

      return kelas;
    } else {
      throw Exception('Gagal Mendapatkan Data Kelas!');
    }
  }
}
