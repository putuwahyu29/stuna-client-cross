class KelasModel {
  late int id;
  late String namaKelas;

    KelasModel({
    required this.id,
    required this.namaKelas,
  });

  KelasModel.fromJson(Map<String, dynamic> json) {
    id = int.parse(json['id']);
    namaKelas = json['nama_kelas'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nama_kelas': namaKelas,
    };
  }
}
