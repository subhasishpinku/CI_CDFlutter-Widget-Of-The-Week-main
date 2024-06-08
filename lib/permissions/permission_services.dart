

import 'package:permission_handler/permission_handler.dart';

abstract class CameraServices {

  Stream<PermissionStatus> get cameraStateChanges;

  Future<PermissionStatus> requestPermission();

  Future<void> openAppSettingsForTheCameraPermission();
}


class CameraPermission implements CameraServices {

  @override
  Stream<PermissionStatus> get cameraStateChanges {
    const camera = Permission.camera;

    return camera.status.asStream().map(
          (permissionStatus) {
        if (permissionStatus.isGranted) {
          return PermissionStatus.granted;
        } else if (permissionStatus.isLimited) {
          return PermissionStatus.limited;
        } else if (permissionStatus.isDenied) {
          return PermissionStatus.denied;
        } else if (permissionStatus.isRestricted) {
          return PermissionStatus.restricted;
        } else {
          return PermissionStatus.permanentlyDenied;
        }
      },
    );
  }

  @override
  Future<PermissionStatus> requestPermission() async {
    const camera = Permission.camera;

    final permissionStatus = await camera.request();

    return permissionStatus;
  }

  @override
  Future<void> openAppSettingsForTheCameraPermission() async {
    await openAppSettings();
  }
}