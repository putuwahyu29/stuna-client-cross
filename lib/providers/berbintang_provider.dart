import 'package:flutter/material.dart';
import 'package:stuna/models/pengumuman_model.dart';

class BerbintangProvider with ChangeNotifier {
  List<PengumumanModel> _berbintang = [];

  List<PengumumanModel> get berbintang => _berbintang;

  set berbintang(List<PengumumanModel> berbintang) {
    _berbintang = berbintang;
    notifyListeners();
  }

  setPengumuman(PengumumanModel pengumuman) {
    if (!isBerbintang(pengumuman)) {
      _berbintang.add(pengumuman);
    } else {
      _berbintang.removeWhere((element) => element.id == pengumuman.id);
    }

    notifyListeners();
  }

  isBerbintang(PengumumanModel pengumuman) {
    if (_berbintang.indexWhere((element) => element.id == pengumuman.id) ==
        -1) {
      return false;
    } else {
      return true;
    }
  }
}
