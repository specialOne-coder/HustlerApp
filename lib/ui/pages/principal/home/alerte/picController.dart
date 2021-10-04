import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class PicController extends GetxController {
  var isLoading = false.obs;
  var imageURL = '';
  File image = File('assets/images/no_user.jpg');
  void uploadImage(ImageSource imageSource) async {
    try {
      final pickedFile = await ImagePicker().pickImage(source: imageSource);
      isLoading(true);
      if (pickedFile != null) {
        image = File(pickedFile.path);
      } else {
        Get.snackbar('Failed', "Vous n'avez pas sélectionné d'image",
            margin: EdgeInsets.only(top: 5, left: 10, right: 10));
      }
    } finally {
      isLoading(false);
    }
  }
}
