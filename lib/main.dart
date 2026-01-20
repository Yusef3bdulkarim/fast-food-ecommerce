import 'package:ecommerce_app_food/core/helpers/init_dependents.dart';
import 'package:ecommerce_app_food/core/routing/app_routing.dart';
import 'package:ecommerce_app_food/core/routing/routing_helper.dart';
import 'package:ecommerce_app_food/features/CartScreens/logic/cubit/cart_cubit.dart';
import 'package:ecommerce_app_food/features/HomeScreens/data/repo/repo_popularProduct.dart';
import 'package:ecommerce_app_food/features/HomeScreens/logic/cubit/home_cubit.dart';
import 'package:ecommerce_app_food/features/HomeScreens/data/repo/repo_recommended.dart';
import 'package:ecommerce_app_food/features/auth/logic/cubit/auth_cubit.dart';
import 'package:ecommerce_app_food/features/location/logic/cubit/location_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ServiceLocator.init();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<HomeCubit>(
          create: (context) => HomeCubit(
            repoPopularproduct: RepoPopularproduct(
              apiServices: ServiceLocator.apiServices,
            ),
            repoRecommendedProduct: RepoRecommendedproduct(
              apiServices: ServiceLocator.apiServices,
            ),
          )..getData(),
        ),

        BlocProvider<CartCubit>(
          create: (context) => CartCubit(cartRepo: ServiceLocator.cartRepo),
        ),

        BlocProvider<AuthCubit>(
          create: (context) => AuthCubit(ServiceLocator.authRepo),
        ),
        BlocProvider<LocationCubit>(create: (context) => LocationCubit()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  // final bool isLoggedIn;
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          onGenerateRoute: AppRouter().onGenerateRoute,
          // home: const SignupScreen(),
          initialRoute: RoutingHelper.splashScreen,
        );
      },
    );
  }
}
