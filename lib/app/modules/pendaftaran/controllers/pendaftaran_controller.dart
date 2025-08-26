import 'package:get/get.dart';
import 'package:getx/app/modules/pendaftaran/views/results_screen_view.dart';

class PendaftaranController extends GetxController {
  // Variabel reaktif untuk field form
  RxString name = ''.obs;
  RxString gender = ''.obs;
  Rxn<DateTime> dateOfBirth = Rxn<DateTime>();
  RxString phone = ''.obs;

  // Variabel error untuk validasi
  RxString nameError = ''.obs;
  RxString genderError = ''.obs;
  RxString dateOfBirthError = ''.obs;
  RxString phoneError = ''.obs;

  // fungsi validasi Name
  void validateName({required String name}) {
    if (name.length < 3) {
      nameError.value = 'Nama minimal 3 karakter';
    } else {
      nameError.value = '';
    }
  }

  void validateGender({required String? jenisKelamin}) {
    if (jenisKelamin == null || jenisKelamin.isEmpty) {
      genderError.value = 'Pilih jenis kelamin';
    } else {
      genderError.value = '';
    }
  }

  void validaateDateofBirth({required DateTime? tanggalLahir}) {
    if (tanggalLahir == null) {
      dateOfBirthError.value = 'Pilih tanggal lahir';
    } else {
      final now = DateTime.now();
      final age = now.year - tanggalLahir.year;
      if (age < 2) {
        dateOfBirthError.value = 'Umur minimal 2 tahun';
      } else {
        dateOfBirthError.value = '';
      }
    }
  }

  void validatePhone({required String phone}) {
    if (!GetUtils.isPhoneNumber(phone)) {
      phoneError.value = 'Nomor telepon tidak valid';
    } else {
      phoneError.value = '';
    }
  }

  void submitForm() {
    validateName(name: name.value);
    validateGender(jenisKelamin: gender.value);
    validaateDateofBirth(tanggalLahir: dateOfBirth.value);
    validatePhone(phone: phone.value);

    if (nameError.value.isEmpty &&
        genderError.value.isEmpty &&
        dateOfBirthError.value.isEmpty &&
        phoneError.value.isEmpty) {
      Get.to(() => ResultsScreenView(
          name: name.value,
          gender: gender.value,
          dateOfBirth: dateOfBirth.value!,
          phone: phone.value));
    } else {
      Get.snackbar('Error', 'Error Makk');
    }
  }

  @override
  void onInit() {
    super.onInit();
  }
}
