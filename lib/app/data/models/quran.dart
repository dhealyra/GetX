class Quran {
  // type
  final String arti, asma, nama, urut, audio, nomor, rukuk, keterangan;
  final int ayat;
  final Type type;

  Quran({
    required this.arti,
    required this.asma,
    required this.ayat,
    required this.nama,
    required this.type,
    required this.urut,
    required this.audio,
    required this.nomor,
    required this.rukuk,
    required this.keterangan,
  });

  factory Quran.fromJson(Map<String, dynamic> json) {
    return Quran(
      arti: json["arti"],
      asma: json["asma"],
      ayat: json["ayat"],
      nama: json["nama"],
      type: json["type"]!,
      urut: json["urut"],
      audio: json["audio"],
      nomor: json["nomor"],
      rukuk: json["rukuk"],
      keterangan: json["keterangan"],
    );
  }
}
