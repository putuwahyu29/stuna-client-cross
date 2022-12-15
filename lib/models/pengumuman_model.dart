import 'package:flutter_dotenv/flutter_dotenv.dart';

class PengumumanModel {
  late int? id;
  late String? judul;
  late String? isi;
  late String? excerpt;
  late DateTime? createdAt;
  late DateTime? updatedAt;
  late String? gambar;
  late String? kelasId;

  PengumumanModel({
    this.id,
    this.judul,
    this.isi,
    this.excerpt,
    this.createdAt,
    this.updatedAt,
    this.gambar,
    this.kelasId,
  });

  PengumumanModel.fromJson(Map<String, dynamic> json) {
    id = int.parse(json['id']);
    judul = json['judul'];
    isi = json['isi'];
    excerpt = json['excerpt'];
    gambar = dotenv.env['BASE_URL'].toString() +
        '/uploads/pengumuman/' +
        json['gambar'];
    kelasId = json['kelas_id'];
    createdAt = DateTime.parse(json['created_at']);
    updatedAt = DateTime.parse(json['updated_at']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'judul': judul,
      'isi': isi,
      'excerpt': excerpt,
      'created_at': createdAt.toString(),
      'updated_at': updatedAt.toString(),
      'kelas_id': kelasId,
    };
  }
}

class UninitializedPengumumanModel extends PengumumanModel {}
