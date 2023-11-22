import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinterest_video_downloader/constants/app_colors.dart';
import 'package:pinterest_video_downloader/views/home/home_view.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      color: AppColors.primaryColor,
      theme: ThemeData(
        expansionTileTheme: const ExpansionTileThemeData(
          textColor: Colors.black,
          childrenPadding: EdgeInsets.symmetric(horizontal: 10),
        ),
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
          backgroundColor: AppColors.primaryColor,
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
        tabBarTheme: const TabBarTheme(
          indicatorSize: TabBarIndicatorSize.tab,
          unselectedLabelColor: Colors.black,
          labelColor: AppColors.primaryColor,
          indicatorColor: AppColors.primaryColor,
        ),
        brightness: Brightness.light,
        primarySwatch: AppColors().materialColor,
      ),
      title: "Instagram Downloader",
      home: const HomeView(),
    );
  }
}
