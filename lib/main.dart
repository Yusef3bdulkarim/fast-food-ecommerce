import 'package:ecommerce_app_food/core/helpers/init_dependents.dart';
import 'package:ecommerce_app_food/core/network/api_serveces.dart';
import 'package:ecommerce_app_food/core/network/dio_client.dart';
import 'package:ecommerce_app_food/core/routing/app_routing.dart';
import 'package:ecommerce_app_food/core/routing/routing_helper.dart';
import 'package:ecommerce_app_food/core/utils/constans_app.dart';
import 'package:ecommerce_app_food/features/CartScreens/logic/cubit/cart_cubit.dart';
import 'package:ecommerce_app_food/features/HomeScreens/data/repo/repo_popularProduct.dart';
import 'package:ecommerce_app_food/features/HomeScreens/logic/cubit/home_cubit.dart';
import 'package:ecommerce_app_food/features/HomeScreens/data/repo/repo_recommended.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ServiceLocator.init();
  final dioClient = DioClient(appBaseUrl: ConstantsApp.baseUrl);
  final apiService = ApiServices(dioClient);
  final popularRepo = RepoPopularproduct(apiServices: apiService);
  final recommendedRepo = RepoRecommendedproduct(apiServices: apiService);
  // final cartRepo = CartRepo(sharedPreferences: );

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<HomeCubit>(
          create: (context) => HomeCubit(
            repoPopularproduct: popularRepo,
            repoRecommendedProduct: recommendedRepo,
          )..getData(),
        ),

        BlocProvider<CartCubit>(
          create: (context) => CartCubit(
            cartRepo: ServiceLocator.cartRepo,
          ), // تأكد من تمرير الـ repo
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          onGenerateRoute: AppRouter().onGenerateRoute,
          // home: SplashScreen(),
          initialRoute: RoutingHelper.splashScreen,
        );
      },
    );
  }
}
