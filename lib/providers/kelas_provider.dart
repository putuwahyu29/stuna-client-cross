import 'package:flutter/material.dart';
import 'package:stuna/models/kelas_model.dart';
import 'package:stuna/services/kelas_service.dart';

class KelasProvider with ChangeNotifier {
  List<KelasModel> _kelas = [];
  List<KelasModel> get kelas => _kelas;
  set kelas(List<KelasModel> kelas) {
    _kelas = kelas;
    notifyListeners();
  }

  Future<void> getAllKelas() async {
    try {
      List<KelasModel> kelas = await KelasService().getAllKelas();
      _kelas = kelas;
    } catch (e) {
      print(e);
    }
  }
}
