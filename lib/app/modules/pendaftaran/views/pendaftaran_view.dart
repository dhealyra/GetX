import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../controllers/pendaftaran_controller.dart';

class PendaftaranView extends StatelessWidget {
  const PendaftaranView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(PendaftaranController());

    return Scaffold(
      appBar: AppBar(title: const Text('PendaftaranView'), centerTitle: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Obx(
                () => TextField(
                  onChanged: (value) {
                    controller.name.value = value;
                    controller.validateName(name: value);
                  },
                  decoration: InputDecoration(
                    labelText: 'Nama Lengkap',
                    errorText: controller.nameError.value.isNotEmpty
                        ? controller.nameError.value
                        : null,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Obx(
                () => DropdownButtonFormField<String>(
                  value: controller.gender.value.isEmpty
                      ? null
                      : controller.gender.value,
                  hint: const Text('Pilih jenis kelamin'),
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
                    errorText: controller.genderError.value.isNotEmpty
                        ? controller.genderError.value
                        : null,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Obx(() => ListTile(
                  title: Text(controller.dateOfBirth.value == null
                      ? 'Pilih tanggal lahir'
                      : DateFormat('dd-MM-yyyy')
                          .format(controller.dateOfBirth.value!)),
                  trailing: Icon(Icons.calendar_today),
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
                  subtitle: controller.dateOfBirthError.value.isNotEmpty
                      ? Text(
                          controller.dateOfBirthError.value,
                          style: TextStyle(color: Colors.red),
                        )
                      : null)),
              const SizedBox(height: 16),
              Obx(
                () => TextField(
                  onChanged: (value) {
                    controller.phone.value = value;
                    // controller.validatePhone(value);
                  },
                  decoration: InputDecoration(
                    labelText: 'Nomor Telepon',
                    errorText: controller.phoneError.value.isNotEmpty
                        ? controller.phoneError.value
                        : null,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                  onPressed: () {
                    controller.submitForm();
                  },
                  child: Text('Submit'))
            ],
          ),
        ),
      ),
    );
  }
}
