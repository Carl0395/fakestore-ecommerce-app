import 'dart:convert';

import 'package:ecommerce_system_design/foundation/app_colors.dart';
import 'package:fake_e_commerce/core/app_config/app_config.dart';
import 'package:fake_e_commerce/core/app_config/app_config_provider.dart';
import 'package:fake_e_commerce/core/extensions/hex_to_color_extension.dart';
import 'package:fake_e_commerce/core/extensions/widget_ref_parametrized_extension.dart';
import 'package:fake_e_commerce/core/route/route_generator.dart';
import 'package:fake_e_commerce/core/route/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

OverlayEntry? modalLoadingOverlay;
OverlayState? overlayState;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final appConfig = await loadParametrizedData();

  runApp(
    ProviderScope(
      overrides: [appConfigProvider.overrideWithValue(appConfig)],
      child: const MyApp(),
    ),
  );
}

Future<AppConfig> loadParametrizedData() async {
  final configString = await rootBundle.loadString('assets/config.json');
  final configJson = jsonDecode(configString);
  return AppConfig.fromJson(configJson);
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'Fake E-Commerce',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.backgroundColor,
        appBarTheme: AppBarTheme(backgroundColor: ref.theme.backgroundColor),
        colorScheme: ColorScheme.fromSeed(seedColor: ref.theme.primaryColor),
      ),
      initialRoute: Routes.products,
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
