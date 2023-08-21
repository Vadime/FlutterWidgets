library utils;

import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:utils/src/navigation.dart';

class FilePicking {
  static Future<File?> pickImage() async {
    FilePickerResult? result;

    Navigation.pushLoading();
    try {
      result = await FilePicker.platform.pickFiles(
        type: FileType.image,
        withData: true,
      );
      if (result != null && result.files.single.path != null) {
        return File(result.files.single.path!);
      }
    } catch (e) {
      return null;
    } finally {
      Navigation.pop();
    }

    return null;
  }
}
