import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum AuthStatus { initial, authenticated, unauthenticated, loading }

class AuthController extends GetxController {
  static AuthController get instance => Get.find();
  
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  
  // Observables
  final Rx<User?> _user = Rx<User?>(null);
  final Rx<AuthStatus> _authStatus = AuthStatus.initial.obs;
  final RxBool _isLoading = false.obs;
  
  // Getters
  User? get user => _user.value;
  AuthStatus get authStatus => _authStatus.value;
  bool get isLoading => _isLoading.value;
  bool get isAuthenticated => _authStatus.value == AuthStatus.authenticated;
  
  @override
  void onInit() {
    super.onInit();
    _user.bindStream(_auth.authStateChanges());
    ever(_user, _setInitialScreen);
  }
  
  void _setInitialScreen(User? user) {
    if (user == null) {
      _authStatus.value = AuthStatus.unauthenticated;
    } else {
      _authStatus.value = AuthStatus.authenticated;
    }
  }
  
  // Email & Password Sign In
  Future<void> signInWithEmailAndPassword(String email, String password) async {
    try {
      _isLoading.value = true;
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      await _saveUserSession();
    } on FirebaseAuthException catch (e) {
      Get.snackbar('Error', e.message ?? 'An error occurred');
    } finally {
      _isLoading.value = false;
    }
  }
  
  // Email & Password Sign Up
  Future<void> signUpWithEmailAndPassword(String email, String password, String name) async {
    try {
      _isLoading.value = true;
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
        email: email, 
        password: password
      );
      
      // Update display name
      await credential.user?.updateDisplayName(name);
      await _saveUserSession();
    } on FirebaseAuthException catch (e) {
      Get.snackbar('Error', e.message ?? 'An error occurred');
    } finally {
      _isLoading.value = false;
    }
  }
  
  // Google Sign In
  Future<void> signInWithGoogle() async {
    try {
      _isLoading.value = true;
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      
      if (googleUser != null) {
        final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );
        
        await _auth.signInWithCredential(credential);
        await _saveUserSession();
      }
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
      await _auth.signOut();
      await _googleSignIn.signOut();
      await _clearUserSession();
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
      await _auth.sendPasswordResetEmail(email: email);
      Get.snackbar('Success', 'Password reset email sent');
    } on FirebaseAuthException catch (e) {
      Get.snackbar('Error', e.message ?? 'An error occurred');
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