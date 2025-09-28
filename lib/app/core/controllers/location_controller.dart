import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

class LocationController extends GetxController {
  static LocationController get instance => Get.find();

  // Observables
  final Rx<Position?> _currentPosition = Rx<Position?>(null);
  final RxString _currentAddress = ''.obs;
  final RxBool _isLoading = false.obs;
  final RxBool _locationPermissionGranted = false.obs;

  // Getters
  Position? get currentPosition => _currentPosition.value;
  String get currentAddress => _currentAddress.value;
  bool get isLoading => _isLoading.value;
  bool get locationPermissionGranted => _locationPermissionGranted.value;

  @override
  void onInit() {
    super.onInit();
    _checkLocationPermission();
  }

  Future<void> _checkLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      Get.snackbar('Error', 'Location services are disabled');
      return;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        Get.snackbar('Error', 'Location permissions are denied');
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      Get.snackbar('Error', 'Location permissions are permanently denied');
      return;
    }

    _locationPermissionGranted.value = true;
    await getCurrentLocation();
  }

  Future<void> getCurrentLocation() async {
    if (!_locationPermissionGranted.value) {
      await _checkLocationPermission();
      if (!_locationPermissionGranted.value) return;
    }

    try {
      _isLoading.value = true;
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      _currentPosition.value = position;
      await _getAddressFromCoordinates(position.latitude, position.longitude);
    } catch (e) {
      Get.snackbar('Error', 'Failed to get current location');
    } finally {
      _isLoading.value = false;
    }
  }

  Future<void> _getAddressFromCoordinates(
      double latitude, double longitude) async {
    try {
      List<Placemark> placemarks =
          await placemarkFromCoordinates(latitude, longitude);
      if (placemarks.isNotEmpty) {
        Placemark place = placemarks[0];
        _currentAddress.value =
            '${place.street}, ${place.subLocality}, ${place.locality}, ${place.administrativeArea}, ${place.postalCode}';
      }
    } catch (e) {
      print('Error getting address: $e');
    }
  }

  Future<List<Location>?> getCoordinatesFromAddress(String address) async {
    try {
      List<Location> locations = await locationFromAddress(address);
      return locations;
    } catch (e) {
      Get.snackbar('Error', 'Failed to get coordinates for address');
      return null;
    }
  }

  double calculateDistance(
      double startLat, double startLng, double endLat, double endLng) {
    return Geolocator.distanceBetween(startLat, startLng, endLat, endLng);
  }
}
