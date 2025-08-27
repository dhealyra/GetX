import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../controllers/pendaftaran_controller.dart';

class PendaftaranView extends StatelessWidget {
  const PendaftaranView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(PendaftaranController());
    final pastelBlue = const Color(0xFFB3C7F7);
    final purpleBlue = const Color(0xFF6C63FF);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Formulir Pendaftaran'),
        centerTitle: true,
        backgroundColor: purpleBlue,
        elevation: 0,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [pastelBlue, purpleBlue],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Card(
              elevation: 10,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
              color: Colors.white.withOpacity(0.96),
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 32),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.assignment_rounded, color: purpleBlue, size: 60),
                    const SizedBox(height: 12),
                    Text(
                      'Isi Data Diri Anda',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: purpleBlue,
                      ),
                    ),
                    const SizedBox(height: 28),
                    Obx(
                      () => TextField(
                        onChanged: (value) {
                          controller.name.value = value;
                          controller.validateName(name: value);
                        },
                        decoration: InputDecoration(
                          labelText: 'Nama Lengkap',
                          labelStyle: TextStyle(color: purpleBlue),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: purpleBlue, width: 2),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: pastelBlue, width: 1.5),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          errorText: controller.nameError.value.isNotEmpty
                              ? controller.nameError.value
                              : null,
                          prefixIcon: Icon(Icons.person, color: purpleBlue),
                        ),
                      ),
                    ),
                    const SizedBox(height: 18),
                    Obx(
                      () => DropdownButtonFormField<String>(
                        value: controller.gender.value.isEmpty
                            ? null
                            : controller.gender.value,
                        hint: Text('Pilih jenis kelamin',
                            style: TextStyle(color: pastelBlue)),
                        items: ['Laki-laki', 'Perempuan']
                            .map((gender) => DropdownMenuItem(
                                  value: gender,
                                  child: Text(gender),
                                ))
                            .toList(),
                        onChanged: (value) {
                          controller.gender.value = value ?? '';
                          controller.validateGender(jenisKelamin: value);
                        },
                        decoration: InputDecoration(
                          labelText: 'Jenis Kelamin',
                          labelStyle: TextStyle(color: purpleBlue),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: purpleBlue, width: 2),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: pastelBlue, width: 1.5),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          errorText: controller.genderError.value.isNotEmpty
                              ? controller.genderError.value
                              : null,
                          prefixIcon: Icon(Icons.wc, color: purpleBlue),
                        ),
                        dropdownColor: Colors.white,
                        iconEnabledColor: purpleBlue,
                      ),
                    ),
                    const SizedBox(height: 18),
                    Obx(() => InkWell(
                          borderRadius: BorderRadius.circular(12),
                          onTap: () async {
                            final selectedDate = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(1900),
                                lastDate: DateTime.now());
                            if (selectedDate != null) {
                              controller.dateOfBirth.value = selectedDate;
                              controller.validaateDateofBirth(
                                  tanggalLahir: selectedDate);
                            }
                          },
                          child: InputDecorator(
                            decoration: InputDecoration(
                              labelText: 'Tanggal Lahir',
                              labelStyle: TextStyle(color: purpleBlue),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: purpleBlue, width: 2),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: pastelBlue, width: 1.5),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              errorText:
                                  controller.dateOfBirthError.value.isNotEmpty
                                      ? controller.dateOfBirthError.value
                                      : null,
                              prefixIcon: Icon(Icons.cake, color: purpleBlue),
                            ),
                            child: Row(
                              children: [
                                Text(
                                  controller.dateOfBirth.value == null
                                      ? 'Pilih tanggal lahir'
                                      : DateFormat('dd-MM-yyyy').format(
                                          controller.dateOfBirth.value!),
                                  style: TextStyle(
                                    color: controller.dateOfBirth.value == null
                                        ? pastelBlue
                                        : Colors.black87,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )),
                    const SizedBox(height: 18),
                    Obx(
                      () => TextField(
                        keyboardType: TextInputType.phone,
                        onChanged: (value) {
                          controller.phone.value = value;
                          // controller.validatePhone(value);
                        },
                        decoration: InputDecoration(
                          labelText: 'Nomor Telepon',
                          labelStyle: TextStyle(color: purpleBlue),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: purpleBlue, width: 2),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: pastelBlue, width: 1.5),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          errorText: controller.phoneError.value.isNotEmpty
                              ? controller.phoneError.value
                              : null,
                          prefixIcon: Icon(Icons.phone, color: purpleBlue),
                        ),
                      ),
                    ),
                    const SizedBox(height: 28),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: purpleBlue,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          elevation: 4,
                        ),
                        onPressed: () {
                          controller.submitForm();
                        },
                        child: const Text(
                          'Submit',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            letterSpacing: 1.2,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
