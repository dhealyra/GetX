import 'package:get/get.dart';
import 'package:getx/app/data/models/quran.dart';
import 'package:getx/app/services/quran_service.dart';

class QuranController extends GetxController {
  final QuranService _quranService = Get.put<QuranService>(QuranService());

  RxList quranList = <Quran>[].obs;
  RxBool isLoading = true.obs;
  RxString errorMessage = ''.obs;

  @override
  void onInit(){
    fetchQuran();
    super.onInit();
  }

  void fetchQuran() async {
    try {
      isLoading.value = true;
      errorMessage('');
      final response = await _quranService.fetchQuran();
      if (response.statusCode == 200) {
        var data = response.body!.map((quranJson) => Quran.fromJson(quranJson)).toList();
        quranList.assignAll(data);
      } else {
        errorMessage('Error: ${response.statusText}');
      }
    } catch (e) {
      errorMessage('Exception: $e');
    } finally {
      isLoading(false);
    }
  }
}
