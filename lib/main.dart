import 'package:flutter/material.dart';
import 'package:flutter_tentwenty_app/routes/app_pages.dart';
import 'package:flutter_tentwenty_app/routes/app_routes.dart';
import 'package:flutter_tentwenty_app/screens/dashboard/dashboard_binding.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Movie App",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      getPages: AppPages.pages,
      initialRoute: Routes.dashboard,
      initialBinding: DashboardBinding(),
      defaultTransition: Transition.fade,
    );
  }
}
