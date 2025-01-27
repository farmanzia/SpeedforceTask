import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showWrongPasswordDialog(String text) {
  Get.dialog(
    AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      title: const Text(
        'Error',
        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red),
      ),
      content:  Text(
        text,
        style: const TextStyle(fontSize: 16),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Get.back(); // Closes the dialog
          },
          child: const Text(
            'Retry',
            style: TextStyle(color: Colors.blue),
          ),
        ),
      ],
    ),
    barrierDismissible: false, // Prevents closing by tapping outside
  );
}