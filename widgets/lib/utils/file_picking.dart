import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:image_compression_flutter/image_compression_flutter.dart';
import 'package:widgets/widgets.dart';

class FilePicking {
  static Future<File?> pickImage() async {
    FilePickerResult? result;

    try {
      result = await FilePicker.platform.pickFiles(
        dialogTitle: 'Select an image',
        type: FileType.image,
        withData: true,
      );
      if (result != null && result.files.single.path != null) {
        final file = result.files.single;

        if (file.path == null && file.bytes == null) return null;

        ImageFile input =
            ImageFile(filePath: file.path!, rawBytes: file.bytes!);

        final image = await compressImage(input);

        return File(image.filePath);
      }
    } catch (e) {
      return null;
    }
    return null;
  }

  static Future<ImageFile> compressImage(ImageFile input) async {
    Logging.log('Input size : ${input.sizeInBytes}');
    Configuration config = const Configuration(
      outputType: ImageOutputType.webpThenJpg,
      // can only be true for Android and iOS while using ImageOutputType.jpg or ImageOutputType.pngÏ
      useJpgPngNativeCompressor: false,
      // set quality between 0-100
      quality: 40,
    );

    final param = ImageFileConfiguration(input: input, config: config);
    final output = await compressor.compress(param);

    Logging.log('Output size : ${output.sizeInBytes}');
    return output;
  }
}
