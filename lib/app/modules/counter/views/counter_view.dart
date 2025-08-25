import 'package:flutter/material.dart';

import 'package:get/get.dart';

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
                "Hitung ke: ${controller.hitung.toString()}",
                style: TextStyle(fontSize: controller.hitung.value.toDouble()),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                    onPressed: controller.increment, child: Text('+')),
                ElevatedButton(
                    onPressed: controller.decrement, child: Text('-'))
              ],
            )
          ],
        ),
      ),
    );
  }
}
