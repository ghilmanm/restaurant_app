import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'presentation/services/dependency_injection.dart';
import 'presentation/services/theme_service.dart';
import 'presentation/services/translations_service.dart';
import 'presentation/routes/app_pages.dart';
import 'presentation/routes/app_routes.dart';
import 'presentation/ui/layouts/main/main_layout.dart';
import 'presentation/ui/theme/themes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DependecyInjection.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (_, __) {
        return GetMaterialApp(
          title: 'Restaurant_app',
          debugShowCheckedModeBanner: false,
          theme: Themes().lightTheme,
          darkTheme: Themes().darkTheme,
          themeMode: ThemeService.instance.themeMode,
          translations: Translation(),
          locale: const Locale('en'),
          fallbackLocale: const Locale('en'),
          initialRoute: AppRoutes.HOME,
          unknownRoute: AppPages.unknownRoutePage,
          getPages: AppPages.pages,
          builder: (_, child) {
            return MainLayout(child: child!);
          },
        );
      },
    );
  }
}
