import 'package:pertandingan_sepakbola/features/bottom_nav_bar/presentations/screens/bottom_nav_bar.dart';
import 'package:pertandingan_sepakbola/features/splash_screen/presentations/screens/splash_screen.dart';
import 'package:pertandingan_sepakbola/navigation/app_paths.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: AppPaths.splashScreen,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: AppPaths.bottomNavBar,
        builder: (context, state) => const BottomNavBarScreen(),
      ),
    ],
  );
}
