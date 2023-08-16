import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

// pour prendre une image dans la galerie
pickImage(ImageSource source) async {
  final ImagePicker imagePicker = ImagePicker();
  XFile? file = await imagePicker.pickImage(source: source);
  if (file != null) {
    return await file.readAsBytes();
  }
  print('No image selected');
}

// pour afficher le snackbar
// dynamic showSnackBar(String content, BuildContext context) {
//   return ScaffoldMessenger.of(context).showSnackBar(
//     SnackBar(
//       content: Text(content),
//     ),
//);
dynamic showSnackBar(String content, BuildContext context) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(content),
    ),
  );
}
