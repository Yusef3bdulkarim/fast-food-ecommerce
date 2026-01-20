import 'package:ecommerce_app_food/core/routing/routing_helper.dart';
import 'package:ecommerce_app_food/features/CartScreens/UI/screens/cart_screen.dart';
import 'package:ecommerce_app_food/features/DetailsScreens/UI/screens/details_screen.dart';
import 'package:ecommerce_app_food/features/DetailsScreens/logic/cubit/product_details_cubit.dart';
import 'package:ecommerce_app_food/features/HomeScreens/UI/screens/home_page.dart';
import 'package:ecommerce_app_food/features/HomeScreens/data/models/model_foodApp.dart';
import 'package:ecommerce_app_food/features/RecommendedScreens/UI/screens/ingredient_screen.dart';
import 'package:ecommerce_app_food/features/RecommendedScreens/logic/cubit/recommended_cubit.dart';
import 'package:ecommerce_app_food/features/auth/UI/screens/login_in_screen.dart';
import 'package:ecommerce_app_food/features/auth/UI/screens/signup_screen.dart';
import 'package:ecommerce_app_food/features/location/UI/screens/location_screen.dart';
import 'package:ecommerce_app_food/main_screen.dart';
import 'package:ecommerce_app_food/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    // استلام الـ Arguments
    final arguments = settings.arguments;

    switch (settings.name) {
      case RoutingHelper.splashScreen:
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case RoutingHelper.locationScreen:
        return MaterialPageRoute(builder: (_) => LocationScreen());
      case RoutingHelper.signUp:
        return MaterialPageRoute(builder: (_) => SignupScreen());
      case RoutingHelper.initial:
        return MaterialPageRoute(builder: (_) => MainScreen());
      case RoutingHelper.cart:
        return MaterialPageRoute(builder: (_) => CartScreen());
      case RoutingHelper.hoomScreen:
        return MaterialPageRoute(builder: (_) => HomePage());
      case RoutingHelper.loginIn:
        return MaterialPageRoute(builder: (_) => LoginInScreen());

      case RoutingHelper.popularProduct:
        // هنا بنحول الـ arguments لنوع الموديل بتاعنا
        final ProductModel product = arguments as ProductModel;
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) =>
                ProductDetailsCubit()
                  ..initProduct((product.price ?? 0).toDouble()),
            child: DetailsScreen(product: product),
          ),
        );

      case RoutingHelper.recommendedProduct:
        final ProductModel product = arguments as ProductModel;
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) =>
                RecommendedCubit()
                  ..initProduct((product.price ?? 0).toDouble()),
            child: IngredientScreen(product: product),
          ),
        );

      default:
        return MaterialPageRoute(
          builder: (_) =>
              const Scaffold(body: Center(child: Text("Page not found"))),
        );
    }
  }
}
