import 'package:auto_route/auto_route_annotations.dart';
import 'package:farming_project/shared/image_picker_cropper.dart';
import 'package:farming_project/ui/product_details_final/animal_add_ui.dart';

@MaterialAutoRouter() //CustomAutoRoute(..config)
class $Router {
  @initial
  AddAnimalUI addAnimalUi;
  ImagePickerCropper imagePickerCropper;
}
