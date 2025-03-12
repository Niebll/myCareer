import 'dart:convert';

class JobTrendModel {
  final int id;
  final String judul;
  final String deskripsi;
  final String gambar;
  final DateTime tanggalTerbit;
  final String waktuTerbit;
  final String link;

  JobTrendModel({
    required this.id,
    required this.judul,
    required this.deskripsi,
    required this.gambar,
    required this.tanggalTerbit,
    required this.waktuTerbit,
    required this.link,
  });

  // Factory method untuk parsing dari JSON
  factory JobTrendModel.fromJson(Map<String, dynamic> json) {
    return JobTrendModel(
      id: json['id'] ?? 0,
      judul: json['judul'] ?? "Tanpa Judul",
      deskripsi: json['deskripsi'] ?? "Deskripsi tidak tersedia",
      gambar: json['gambar'] ?? "default.png",
      tanggalTerbit: json['tanggalTerbit'] != null
          ? DateTime.parse(json['tanggalTerbit'])
          : DateTime.now(),
      waktuTerbit: json['waktuTerbit'] ?? "00:00",
      link: json['link'] ?? "#",
    );
  }

  // Konversi objek ke JSON
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "judul": judul,
      "deskripsi": deskripsi,
      "gambar": gambar,
      "tanggalTerbit": tanggalTerbit.toIso8601String(),
      "waktuTerbit": waktuTerbit,
      "link": link,
    };
  }

  // Parsing List dari JSON
  static List<JobTrendModel> fromJsonList(String jsonString) {
    final List<dynamic> jsonData = json.decode(jsonString);
    return jsonData.map((item) => JobTrendModel.fromJson(item)).toList();
  }
}
