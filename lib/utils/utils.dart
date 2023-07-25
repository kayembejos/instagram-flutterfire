import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

// pour prendre une image dans la galerie
pickImage(ImageSource source) async {
  final ImagePicker imagePicker = ImagePicker();
  XFile? _file = await imagePicker.pickImage(source: source);
  if (_file != null) {
    return await _file.readAsBytes();
  }
  print('No image selected');
}

// pour afficher le snackbar
showSnackBar(BuildContext context, String text) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(text),
    ),
  );
}
