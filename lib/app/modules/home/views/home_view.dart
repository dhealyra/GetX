import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/app/modules/pendaftaran/views/pendaftaran_view.dart';
import 'package:getx/app/modules/post/views/post_view.dart';
import 'package:getx/app/modules/quran/views/quran_view.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pastelGreen = const Color(0xFFD0F5E8);
    final green = const Color(0xFF4CAF50);
    final white = Colors.white;

    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        title: const Text(
          'Aplikasi Al-Qur\'an',
          style: TextStyle(color: Colors.black87),
        ),
        centerTitle: true,
        backgroundColor: white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black87),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: pastelGreen,
                  shape: BoxShape.circle,
                ),
                padding: const EdgeInsets.all(18),
                child: Icon(Icons.menu_book_rounded, color: green, size: 48),
              ),
              const SizedBox(height: 18),
              Text(
                'Selamat Datang di Aplikasi Al-Qur\'an',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: green,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                'Pilih menu di bawah untuk mulai membaca atau menggunakan fitur lain.',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black54,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: green,
                  foregroundColor: white,
                  minimumSize: const Size.fromHeight(44),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 0,
                ),
                onPressed: () => Get.to(() => QuranView()),
                child: const Text(
                  'Baca Al-Qur\'an',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
              ),
              const SizedBox(height: 14),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: pastelGreen,
                  foregroundColor: green,
                  minimumSize: const Size.fromHeight(44),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 0,
                  side: BorderSide(color: green, width: 1),
                ),
                onPressed: () => Get.to(() => PendaftaranView()),
                child: const Text(
                  'Formulir Pendaftaran',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
              ),
              const SizedBox(height: 14),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: white,
                  foregroundColor: green,
                  minimumSize: const Size.fromHeight(44),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 0,
                  side: BorderSide(color: pastelGreen, width: 1),
                ),
                onPressed: () => Get.to(() => PostView()),
                child: const Text(
                  'Halaman Post',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
