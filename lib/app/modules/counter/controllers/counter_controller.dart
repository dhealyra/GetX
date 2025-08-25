import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CounterController extends GetxController {
  //TODO: Implement CounterController
  RxInt hitung = 99.obs;

  void increment() {
    if (hitung < 100) {
      hitung++;
    } else {
      Get.snackbar("Stop", "Counter tak boleh lebih dari 100",
          backgroundColor: Colors.blue,
          icon: Icon(
            Icons.warning,
            color: Colors.white,
          ),
          snackPosition: SnackPosition.BOTTOM,
          colorText: Colors.white);
    }
  }

  void decrement() {
    if (hitung > 1) {
      hitung--;
    } else {
      Get.snackbar("Stop", "Counter tak boleh kurang dari 1",
          backgroundColor: Colors.blue,
          icon: Icon(
            Icons.warning,
            color: Colors.white,
          ),
          snackPosition: SnackPosition.BOTTOM,
          colorText: Colors.white);
    }
  }
}
