import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getx/app/modules/quran/views/quran_detail_view.dart';

import '../controllers/quran_controller.dart';

class QuranView extends GetView<QuranController> {
  QuranView({Key? key}) : super(key: key);
  final QuranController controller = Get.put(QuranController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Al-Quran'),
        centerTitle: true,
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.errorMessage.isNotEmpty) {
          return Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(controller.errorMessage.value),
                const SizedBox(height: 8),
                ElevatedButton(
                  onPressed: controller.fetchQuran,
                  child: const Text('Coba lagi'),
                ),
              ],
            ),
          );
        }

        final quran = controller.quranList;
        if (quran.isEmpty) {
          return const Center(
            child: Text('Data Kosong'),
          );
        }

        return ListView.separated(
          itemCount: quran.length,
          separatorBuilder: (context, index) => const Divider(height: 1),
          itemBuilder: (context, index) {
            final surah = quran[index];
            return ListTile(
              leading: CircleAvatar(
                child: Text(surah.urut.toString()),
              ),
              title: Text('${surah.nama}'),
              subtitle: Text('Ayat: ${surah.ayat}'),
              onTap: () => Get.to(() => QuranDetailView(quran: surah)),
            );
          },
        );
      }),
    );
  }
}
