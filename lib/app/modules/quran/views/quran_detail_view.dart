import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getx/app/data/models/quran.dart';

class QuranDetailView extends GetView {
  final Quran quran;

  QuranDetailView({Key? key, required this.quran}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text('Detail View Quran ${quran.nama}'),
        centerTitle: true,
      ),
      body: Padding(padding: const EdgeInsets.all(16.0), child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Surah: ${quran.nama}', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          SizedBox(height: 8),
          Text('Ayat: ${quran.ayat}', style: TextStyle(fontSize: 18)),
          SizedBox(height: 16),
          Text(quran.arti, style: TextStyle(fontSize: 16)),
          const SizedBox(height: 16),
              Text(
                quran.nama,
                style: Theme.of(
                  context,
                ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              Text(quran.arti, style: Theme.of(context).textTheme.bodyLarge),
        ],
      )),
    );
  }
}
