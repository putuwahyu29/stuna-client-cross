import 'package:flutter/material.dart';
import 'package:stuna/models/pengumuman_model.dart';
import 'package:stuna/services/pengumuman_service.dart';

class PengumumanProvider with ChangeNotifier {
  List<PengumumanModel> _pengumumanLimit = [];
  List<PengumumanModel> get pengumumanLimit => _pengumumanLimit;
  set pengumumanLimit(List<PengumumanModel> pengumumanLimit) {
    _pengumumanLimit = pengumumanLimit;
    notifyListeners();
  }

  List<PengumumanModel> _pengumumanSemua = [];
  List<PengumumanModel> get pengumumanSemua => _pengumumanSemua;
  set pengumumanSemua(List<PengumumanModel> pengumumanSemua) {
    _pengumumanSemua = pengumumanSemua;
    notifyListeners();
  }

  Future<void> getPengumumanByKelasIdLimit(kelasId) async {
    try {
      List<PengumumanModel> pengumumanLimit = await PengumumanService()
          .getPengumumanByKelasIdLimit(kelasId: kelasId);
      _pengumumanLimit = pengumumanLimit;
    } catch (e) {
      print(e);
    }
  }

  Future<void> getPengumumanByKelasId(kelasId) async {
    try {
      List<PengumumanModel> pengumumanSemua = await PengumumanService()
          .getPengumumanByKelasIdLimit(kelasId: kelasId);
      _pengumumanSemua = pengumumanSemua;
    } catch (e) {
      print(e);
    }
  }
}
