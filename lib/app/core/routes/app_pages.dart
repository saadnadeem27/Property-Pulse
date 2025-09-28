import 'package:get/get.dart';
import '../../modules/splash/splash_screen.dart';
import '../../modules/onboarding/onboarding_screen.dart';
import '../../modules/auth/login_screen.dart';
import '../../modules/auth/signup_screen.dart';
import '../../modules/auth/forgot_password_screen.dart';
import '../../modules/main/main_navigation.dart';
import '../../modules/property/property_details_screen.dart';

import 'app_routes.dart';

class AppPages {
  static const String initial = AppRoutes.splash;

  static final List<GetPage> routes = [
    GetPage(
      name: AppRoutes.splash,
      page: () => const SplashScreen(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppRoutes.onboarding,
      page: () => const OnboardingScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: AppRoutes.login,
      page: () => const LoginScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: AppRoutes.signup,
      page: () => const SignupScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: AppRoutes.forgotPassword,
      page: () => const ForgotPasswordScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: AppRoutes.main,
      page: () => const MainNavigation(),
      transition: Transition.fadeIn,
    ),
    // Property Details will be handled with Get.arguments
    GetPage(
      name: AppRoutes.propertyDetails,
      page: () => PropertyDetailsScreen(property: Get.arguments),
      transition: Transition.rightToLeft,
    ),
  ];
}
