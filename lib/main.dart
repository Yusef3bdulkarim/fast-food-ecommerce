import 'package:ecommerce_app_food/core/routing/routing_helper.dart';
import 'package:ecommerce_app_food/core/helpers/dependencies.dart';
import 'package:ecommerce_app_food/features/homeScreen/UI/screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      initialRoute: RoutingHelper.initialScreen,
      getPages: RoutingHelper.routers,
    );
  }
}
