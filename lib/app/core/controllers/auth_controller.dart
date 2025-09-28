import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum AuthStatus { initial, authenticated, unauthenticated, loading }

// Dummy User class for frontend demo
class DummyUser {
  final String uid;
  final String? email;
  final String? displayName;

  DummyUser({required this.uid, this.email, this.displayName});
}

class AuthController extends GetxController {
  static AuthController get instance => Get.find();

  // Observables
  final Rx<DummyUser?> _user = Rx<DummyUser?>(null);
  final Rx<AuthStatus> _authStatus = AuthStatus.initial.obs;
  final RxBool _isLoading = false.obs;

  // Getters
  DummyUser? get user => _user.value;
  AuthStatus get authStatus => _authStatus.value;
  bool get isLoading => _isLoading.value;
  bool get isAuthenticated => _authStatus.value == AuthStatus.authenticated;

  @override
  void onInit() {
    super.onInit();
    ever(_user, _setInitialScreen);
  }

  void _setInitialScreen(DummyUser? user) {
    if (user == null) {
      _authStatus.value = AuthStatus.unauthenticated;
    } else {
      _authStatus.value = AuthStatus.authenticated;
    }
  }

  // Dummy Email & Password Sign In - No validation, direct login
  Future<void> signInWithEmailAndPassword(String email, String password) async {
    try {
      _isLoading.value = true;
      
      // Simulate loading delay
      await Future.delayed(const Duration(seconds: 1));
      
      // Create dummy user
      _user.value = DummyUser(
        uid: 'dummy_user_123',
        email: email.isEmpty ? 'demo@propertypulse.com' : email,
        displayName: 'Demo User',
      );
      
      await _saveUserSession();
      Get.snackbar('Success', 'Welcome to Property Pulse!');
      
      // Navigate to main dashboard
      Get.offAllNamed('/main');
    } catch (e) {
      Get.snackbar('Error', 'Something went wrong');
    } finally {
      _isLoading.value = false;
    }
  }

  // Dummy Email & Password Sign Up
  Future<void> signUpWithEmailAndPassword(
      String email, String password, String name) async {
    try {
      _isLoading.value = true;
      
      // Simulate loading delay
      await Future.delayed(const Duration(seconds: 1));
      
      // Create dummy user
      _user.value = DummyUser(
        uid: 'dummy_user_123',
        email: email.isEmpty ? 'demo@propertypulse.com' : email,
        displayName: name.isEmpty ? 'Demo User' : name,
      );
      
      await _saveUserSession();
      Get.snackbar('Success', 'Account created successfully!');
      
      // Navigate to main dashboard
      Get.offAllNamed('/main');
    } catch (e) {
      Get.snackbar('Error', 'Something went wrong');
    } finally {
      _isLoading.value = false;
    }
  }

  // Dummy Google Sign In
  Future<void> signInWithGoogle() async {
    try {
      _isLoading.value = true;
      
      // Simulate loading delay
      await Future.delayed(const Duration(seconds: 1));
      
      // Create dummy Google user
      _user.value = DummyUser(
        uid: 'dummy_google_user_123',
        email: 'demo.google@propertypulse.com',
        displayName: 'Google Demo User',
      );
      
      await _saveUserSession();
      Get.snackbar('Success', 'Signed in with Google!');
    } catch (e) {
      Get.snackbar('Error', 'Failed to sign in with Google');
    } finally {
      _isLoading.value = false;
    }
  }

  // Sign Out
  Future<void> signOut() async {
    try {
      _isLoading.value = true;
      _user.value = null;
      await _clearUserSession();
      Get.snackbar('Success', 'Signed out successfully');
    } catch (e) {
      Get.snackbar('Error', 'Failed to sign out');
    } finally {
      _isLoading.value = false;
    }
  }

  // Reset Password
  Future<void> resetPassword(String email) async {
    try {
      _isLoading.value = true;
      
      // Simulate delay
      await Future.delayed(const Duration(seconds: 1));
      
      Get.snackbar('Success', 'Password reset email sent (Demo)');
    } catch (e) {
      Get.snackbar('Error', 'Something went wrong');
    } finally {
      _isLoading.value = false;
    }
  }

  // Save user session
  Future<void> _saveUserSession() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', true);
    if (user != null) {
      await prefs.setString('userId', user!.uid);
      await prefs.setString('userEmail', user!.email ?? '');
      await prefs.setString('userName', user!.displayName ?? '');
    }
  }

  // Clear user session
  Future<void> _clearUserSession() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}
