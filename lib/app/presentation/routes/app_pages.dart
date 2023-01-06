import 'package:drinking_app/app/presentation/controllers/login/login_binding.dart';
import 'package:drinking_app/app/presentation/controllers/register/register_binding.dart';
import 'package:drinking_app/app/presentation/routes/app_routes.dart';
import 'package:drinking_app/app/presentation/views/login_view.dart';
import 'package:drinking_app/app/presentation/views/register_view.dart';
import 'package:drinking_app/app/presentation/views/splash_screen_view.dart';
import 'package:get/route_manager.dart';

class AppPages {
  static List<GetPage> pages = [
    GetPage(
      name: AppRoutes.splashScreenViewRout,
      page: () => const SplashScreenview(),
    ),
    GetPage(
      name: AppRoutes.loginviewRoute,
      page: () => const LoginView(),
      binding: LoginBinding.instnace,
    ),
    GetPage(
      name: AppRoutes.registerviewRoute,
      page: () => const RegisterView(),
      binding: RegisterBindng.instance,
    ),
  ];
}
