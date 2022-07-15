import 'package:camera/camera.dart';

class CameraInfo {
  late List<CameraDescription> _cameras;
  late CameraController? controller;

  void getData() {
    List<int> width, height;
    controller = CameraController(_cameras[0], ResolutionPreset.max);
  }
}
