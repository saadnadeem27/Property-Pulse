import 'package:get/get.dart';
import 'package:flutter/material.dart';

class AppController extends GetxController {
  static AppController get instance => Get.find();

  // App state
  final RxBool _isLoading = false.obs;
  final RxString _currentLanguage = 'en'.obs;
  final RxBool _isDarkMode = false.obs;

  // Getters
  bool get isLoading => _isLoading.value;
  String get currentLanguage => _currentLanguage.value;
  bool get isDarkMode => _isDarkMode.value;

  @override
  void onInit() {
    super.onInit();
    _initializeApp();
  }

  void _initializeApp() async {
    setLoading(true);

    // Initialize app-level configurations
    await Future.delayed(const Duration(seconds: 2)); // Simulate initialization

    setLoading(false);
  }

  void setLoading(bool value) {
    _isLoading.value = value;
  }

  void changeLanguage(String languageCode) {
    _currentLanguage.value = languageCode;
    // Update app locale
    Get.updateLocale(Locale(languageCode));
  }

  void toggleTheme() {
    _isDarkMode.value = !_isDarkMode.value;
    Get.changeThemeMode(_isDarkMode.value ? ThemeMode.dark : ThemeMode.light);
  }

  void showSnackbar(String title, String message, {bool isError = false}) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.TOP,
      backgroundColor: isError ? Colors.red.shade100 : Colors.green.shade100,
      colorText: isError ? Colors.red.shade800 : Colors.green.shade800,
      duration: const Duration(seconds: 3),
      margin: const EdgeInsets.all(16),
      borderRadius: 12,
    );
  }
}
