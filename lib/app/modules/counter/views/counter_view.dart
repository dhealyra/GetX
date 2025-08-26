import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/app/modules/pendaftaran/views/pendaftaran_view.dart';

import '../controllers/counter_controller.dart';

class CounterView extends GetView<CounterController> {
  const CounterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CounterView'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(
              () => Text(
                "Hitung ke: ${controller.hitung.value.toString()}",
                style: TextStyle(fontSize: controller.hitung.value.toDouble()),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: controller.increment,
                  child: const Text('+'),
                ),
                ElevatedButton(
                  onPressed: controller.decrement,
                  child: const Text('-'),
                ),
                InkWell(
                  onTap: () => Get.to(() => PendaftaranView()),
                  child: const Icon(Icons.forum_sharp),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
