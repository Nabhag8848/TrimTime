import 'package:flutter/material.dart';
import 'package:frontend/src/barber/auth/login_page.dart';
import 'package:frontend/src/barber/auth/signup_page.dart';
import 'package:frontend/src/barber/home/barber_home.dart';
import 'package:frontend/src/customer/home/available_shops.dart';
import 'package:frontend/src/customer/home/select_time.dart';
import 'package:frontend/src/customer/auth/login_page.dart';
import 'package:frontend/src/customer/auth/signup_page.dart';
import 'package:frontend/src/customer/home/customer_home.dart';
import 'package:frontend/src/maps/maps_page.dart';
import 'package:frontend/src/welcome_page.dart';

class Routes {
  static const String initalRoute = "/";

  // Barber Routes
  static const String barberLoginRoute = "/barber/login";
  static const String barberSignUpRoute = "/barber/signup";
  static const String barberHomeRoute = "/barber/home";

  // Customer Routes
  static const String customerLoginRoute = "/customer/login";
  static const String customerSignUpRoute = "/customer/signup";
  static const String customerHomeRoute = "/customer/home";

  // Generatl Routes
  static const String mapRoute = "/mapPage";
  static const String selectTimeRoute = "/select-time";
  static const String availableShops = "/available-shops";

  static Route<dynamic> getRoutes(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case Routes.initalRoute:
        return getRoute(const WelcomePage());
      // Barber
      case Routes.barberLoginRoute:
        return getRoute(const BarberLoginPage());
      case Routes.barberSignUpRoute:
        return getRoute(const BarberSignUpPage());
      case Routes.barberHomeRoute:
        return getRoute(const BarberHomePage());

      // Customer
      case Routes.customerLoginRoute:
        return getRoute(const CustomerLoginPage());
      case Routes.customerSignUpRoute:
        return getRoute(const CustomerSignUpPage());
      case Routes.customerHomeRoute:
        return getRoute(const CustomerHomePage());

      // General Routes
      case Routes.mapRoute:
        return getRoute(const MapsPage());
      case Routes.selectTimeRoute:
        return getRoute(const SelectTimePage());
      case Routes.availableShops:
        return getRoute(AvailableShopsPage(time: args as String));

      default:
        return getRoute(const WelcomePage());
    }
  }

  static MaterialPageRoute getRoute(Widget route) {
    return MaterialPageRoute(builder: (_) => route);
  }
}
