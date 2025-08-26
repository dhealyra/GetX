import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ResultsScreenView extends GetView {
  const ResultsScreenView({
    super.key,
    required this.name,
    required this.gender,
    required this.dateOfBirth,
    required this.phone,
  });
  final String name;
  final String gender;
  final DateTime dateOfBirth;
  final String phone;

  @override
  Widget build(BuildContext context) {
    final pastelBlue = const Color(0xFFB3C7F7);
    final purpleBlue = const Color(0xFF6C63FF);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Hasil Pendaftaran'),
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
              elevation: 8,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
              color: Colors.white.withOpacity(0.95),
              margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Padding(
                padding: const EdgeInsets.all(28.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.check_circle_rounded,
                        color: purpleBlue, size: 64),
                    const SizedBox(height: 16),
                    Text(
                      'Data Pendaftaran',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: purpleBlue,
                      ),
                    ),
                    const SizedBox(height: 24),
                    _buildInfoRow('Nama', name, purpleBlue),
                    const SizedBox(height: 12),
                    _buildInfoRow('Jenis Kelamin', gender, purpleBlue),
                    const SizedBox(height: 12),
                    _buildInfoRow(
                        'Tanggal Lahir',
                        DateFormat('dd-MM-yyyy').format(dateOfBirth),
                        purpleBlue),
                    const SizedBox(height: 12),
                    _buildInfoRow('No. Telepon', phone, purpleBlue),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value, Color color) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$label:',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: color,
            fontSize: 16,
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            value,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.black87,
            ),
          ),
        ),
      ],
    );
  }
}
