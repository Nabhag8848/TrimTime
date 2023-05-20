import 'package:flutter/material.dart';
import 'package:frontend/src/barber/auth/login_page.dart';
import 'package:frontend/src/barber/auth/signup_page.dart';
import 'package:frontend/src/customer/auth/login_page.dart';
import 'package:frontend/src/customer/auth/signup_page.dart';
import 'package:frontend/src/maps/maps_page.dart';
import 'package:frontend/src/welcome_page.dart';

class Routes {
  static const String initalRoute = "/";

  // Barber Routes
  static const String barberLoginRoute = "/barber/login";
  static const String barberSignUpRoute = "/barber/signup";

  // Customer Routes
  static const String customerLoginRoute = "/customer/login";
  static const String customerSignUpRoute = "/customer/signup";
  static const String homeRoute = "/HomePage";
  static const String mapRoute = "/mapPage";

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

      // Customer
      case Routes.customerLoginRoute:
        return getRoute(const CustomerLoginPage());
      case Routes.customerSignUpRoute:
        return getRoute(const CustomerSignUpPage());

      case Routes.mapRoute:
        return getRoute(const MapsPage());
      default:
        return getRoute(const WelcomePage());
    }
  }

  static MaterialPageRoute getRoute(Widget route) {
    return MaterialPageRoute(builder: (_) => route);
  }
}
