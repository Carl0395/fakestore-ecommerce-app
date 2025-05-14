import 'package:ecommerce_system_design/foundation/app_colors.dart';
import 'package:fake_e_commerce/core/route/route_generator.dart';
import 'package:fake_e_commerce/core/route/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

OverlayEntry? modalLoadingOverlay;
OverlayState? overlayState;

void main() {
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fake E-Commerce',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.backgroundColor,
        appBarTheme: AppBarTheme(backgroundColor: AppColors.backgroundColor),
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryButton),
      ),
      initialRoute: Routes.products,
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
