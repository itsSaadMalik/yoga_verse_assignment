import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yoga_verse/core/route_names.dart';
import 'package:yoga_verse/core/themes/app_theme.dart';
import 'package:yoga_verse/features/about%20and%20update/presentation/screens/about_and_update.dart';
import 'package:yoga_verse/features/app%20features/presentation/screens/app_features_screen.dart';
import 'package:yoga_verse/features/auth/presentation/screens/login_view.dart';
import 'package:yoga_verse/features/auth/presentation/screens/splash_screen.dart';
import 'package:yoga_verse/features/home/presentation/screens/home_page.dart';
import 'package:yoga_verse/features/home/presentation/widgets/features_section.dart';
import 'package:yoga_verse/features/products/presentation/screens/new_products_screen.dart';
import 'package:yoga_verse/features/user%20cart/presentation/cart_screen.dart';
import 'package:yoga_verse/features/yoga_session/presentation/screens/yoga_session_screen.dart';
import 'package:yoga_verse/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: AppTheme.lightTheme,
      // home: const LoginView(),
      // initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        RouteNames.login: (context) => LoginView(),

        '/home': (context) => HomePage(),
        '/yoga_session': (context) => YogaSessionScreen(),
        RouteNames.productsScreen: (context) => NewProductsScreen(),
        RouteNames.myCart: (context) => CartScreen(),
        RouteNames.features: (context) => AppFeatures(),
        RouteNames.about: (context) => AboutApp(),
      },
    );
  }
}
