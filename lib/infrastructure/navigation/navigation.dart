import 'package:get/get.dart';

import 'package:pixlify/infrastructure/navigation/bindings/controllers/controllers_bindings.dart';
import 'package:pixlify/infrastructure/navigation/routes.dart';
import 'package:pixlify/presentation/screens.dart';

/// Contains List of all pages in the app
class Nav {
  static List<GetPage> routes = [
    GetPage(
      name: Routes.WALKTHROUGH,
      page: () => const WalkthroughScreen(),
      binding: WalkthroughControllerBinding(),
    ),
    GetPage(
      name: Routes.WELCOME,
      page: () => const WelcomeScreen(),
    ),
    GetPage(
      name: Routes.SPLASH,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: Routes.SIGN_IN,
      page: () => const SignInScreen(),
      binding: SignInControllerBinding(),
    ),
    GetPage(
      name: Routes.FORGOT_PASSWORD,
      page: () => const ForgotPasswordScreen(),
      binding: ForgotPasswordControllerBinding(),
    ),
    GetPage(
      name: Routes.SIGN_UP,
      page: () => const SignUpScreen(),
      binding: SignUpControllerBinding(),
    ),
    GetPage(
      name: Routes.PERSONAL_INFO,
      page: () => const PersonalInfoScreen(),
      binding: PersonalInfoControllerBinding(),
    ),
    GetPage(
      name: Routes.AUTH_WRAPPER,
      page: () => const AuthWrapperScreen(),
      binding: AuthWrapperControllerBinding(),
    ),
    GetPage(
      name: Routes.HOME_VIEW,
      page: () => const HomeViewScreen(),
      binding: HomeViewControllerBinding(),
    ),
    GetPage(
      name: Routes.AI_TOOLBOX,
      page: () => const AiToolboxScreen(),
      binding: AiToolboxControllerBinding(),
    ),
    GetPage(
      name: Routes.ACCOUNT,
      page: () => const AccountScreen(),
      binding: AccountControllerBinding(),
    ),
    GetPage(
      name: Routes.LANDING_PAGE,
      page: () => const LandingPageScreen(),
      binding: LandingPageControllerBinding(),
    ),
  ];
}
