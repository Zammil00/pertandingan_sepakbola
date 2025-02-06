import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pertandingan_sepakbola/navigation/app_router.dart';
import 'package:go_router/go_router.dart';
import 'core/config/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  final GoRouter _router = AppRouter.router;

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      builder: (context, child) {
        return GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            FocusScopeNode currentFocus = FocusScope.of(context);
            if (!currentFocus.hasPrimaryFocus &&
                currentFocus.focusedChild != null) {
              FocusManager.instance.primaryFocus!.unfocus();
            }
          },
          child: MaterialApp.router(
            showSemanticsDebugger: false,
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.lightTheme,
            routerConfig: _router,
          ),
        );
      },
    );
  }
}
