import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hustler/services/userService.dart';
import 'package:image_picker/image_picker.dart';

class ProfileController extends GetxController {
  var isLoading = false.obs;
  var imageURL = '';

  void uploadImage(ImageSource imageSource, name) async {
    try {
      final pickedFile = await ImagePicker().pickImage(source: imageSource);
      isLoading(true);
      if (pickedFile != null) {
        var response = await UserService().uploadFile(pickedFile.path, name);

        if (response.statusCode == 200) {
          //get image url from api response
          var rep = json.decode(response.body);
          imageURL = rep['pictures'];
          Get.snackbar('Success', 'Vous avez mis à jour votre photo de profil',
              margin: EdgeInsets.only(top: 5, left: 10, right: 10));
        } else {
          Get.snackbar('Failed', "format invalide , l'image doit etre < 500 ko",
              margin: EdgeInsets.only(top: 5, left: 10, right: 10));
        }
      } else {
        Get.snackbar('Failed', "Vous n'avez pas sélectionné d'image",
            margin: EdgeInsets.only(top: 5, left: 10, right: 10));
      }
    } finally {
      isLoading(false);
    }
  }
}
