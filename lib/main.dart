import 'package:flutter/material.dart';
import 'package:get/get.dart';
import ' theme/app_theme.dart';
import 'routes/app_pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Smart Investor Deck",
      theme: AppTheme.lightTheme,
      initialRoute: AppPages.login,
      getPages: AppPages.routes,
    );
  }
}
