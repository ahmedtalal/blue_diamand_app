import 'package:drinking_app/app/presentation/routes/app_routes.dart';
import 'package:drinking_app/app/presentation/views/cart_view.dart';
import 'package:drinking_app/app/presentation/views/home_view.dart';
import 'package:drinking_app/app/presentation/views/login_view.dart';
import 'package:drinking_app/app/presentation/views/main_view.dart';
import 'package:drinking_app/app/presentation/views/notification_view.dart';
import 'package:drinking_app/app/presentation/views/offers_view.dart';
import 'package:drinking_app/app/presentation/views/products_view.dart';
import 'package:drinking_app/app/presentation/views/register_view.dart';
import 'package:drinking_app/app/presentation/views/splash_screen_view.dart';
import 'package:drinking_app/app/presentation/views/user_profile_view.dart';
import 'package:get/route_manager.dart';

class AppPages {
  static List<GetPage> pages = [
    GetPage(
      name: AppRoutes.splashScreenViewRout,
      page: () => const SplashScreenView(),
    ),
    GetPage(
      name: AppRoutes.loginviewRoute,
      page: () => const LoginView(),
    ),
    GetPage(
      name: AppRoutes.registerviewRoute,
      page: () => const RegisterView(),
    ),
    GetPage(
      name: AppRoutes.mainViewRoute,
      page: () => const MainView(),
    ),
    GetPage(
      name: AppRoutes.offersViewRoute,
      page: () => const OffersView(),
    ),
    GetPage(
      name: AppRoutes.productsViewRoute,
      page: () => const ProductsView(),
    ),
    GetPage(
      name: AppRoutes.notificationViewRoute,
      page: () => const NotificationView(),
    ),
    GetPage(
      name: AppRoutes.homeViewRoute,
      page: () => const HomeView(),
    ),
    GetPage(
      name: AppRoutes.cartViewRoute,
      page: () => const CartView(),
    ),
    GetPage(
      name: AppRoutes.userProfileViewRoute,
      page: () => const UserProfileView(),
    ),
  ];
}
