class UserModel {
  late int id;
  late String username;
  late String fullName;
  late String? namaPanggilan;
  late String email;
  late String? alamat;
  late String? noHp;
  late String? nim;
  late String? kelasId;
  late String profilePhotoUrl;
  late String? token;

  UserModel(
      {required this.id,
      required this.username,
      required this.fullName,
      required this.namaPanggilan,
      required this.email,
      required this.alamat,
      required this.noHp,
      required this.nim,
      required this.kelasId,
      required this.profilePhotoUrl,
      required this.token});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    fullName = json['fullName'];
    namaPanggilan = json['nama_panggilan'];
    email = json['email'];
    alamat = json['alamat'];
    noHp = json['no_hp'];
    nim = json['nim'];
    kelasId = json['kelas_id'];
    profilePhotoUrl = json['profile_photo_url'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'username': username,
      'fullName': fullName,
      'nama_panggilan': namaPanggilan,
      'email': email,
      'alamat': alamat,
      'no_hp': noHp,
      'nim': nim,
      'kelas_id': kelasId,
      'profile_photo_url': profilePhotoUrl,
      'token': token,
    };
  }
}
