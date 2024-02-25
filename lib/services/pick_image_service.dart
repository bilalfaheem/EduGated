import 'package:edugated/domain/failures/pick_image_failure.dart';
import 'package:fpdart/fpdart.dart';
import 'package:image_picker/image_picker.dart';

class PickImageService {
  final picker = ImagePicker();

  Future<Either<PickImageFailure, String>> pickImageFromGallery() async =>
      await picker.pickImage(source: ImageSource.gallery).then((value) {
        if (value == null) {
          return left(PickImageFailure(error: "Unable to Pick Image"));
        } else {
          return right(value.path);
        }
      });
}
