import 'package:another_flushbar/flushbar.dart';
import 'package:bank_pit_bwa/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:image_picker/image_picker.dart';

void showCustomSnackBar(BuildContext context, String message) {
  Flushbar(
    message: message,
    flushbarPosition: FlushbarPosition.TOP,
    backgroundColor: redColor,
    duration: const Duration(seconds: 2),
  ).show(context);
}

String formatCurrency(num number, {String symbol = 'Rp '}) {
  return NumberFormat.currency(
    locale: 'id',
    symbol: symbol,
    decimalDigits: 0,
  ).format(number);
}

Future<XFile?> selectImage() async {
  try {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    return image;
  } catch (e) {
    print("Error selecting image: $e");
    return null;
  }
}
