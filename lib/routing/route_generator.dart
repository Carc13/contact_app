import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/contact_model.dart';
import '../view/pages/contact_details_screen.dart';
import '../view/pages/contact_list_screen.dart';

class RouteGenerator {
  
  static Route<dynamic> generateRoute(RouteSettings settings) {
    
    switch (settings.name) {

      case ContactListScreen.routeName:
        return GetPageRoute(
          popGesture: false,
          transition: Transition.fadeIn,
          transitionDuration: const Duration(milliseconds: 250),
          settings: const RouteSettings(name: ContactListScreen.routeName),
          page: () => const ContactListScreen(),
        );

      case ContactDetailsScreen.routeName:

        final ContactModel? contact = settings.arguments as ContactModel?;

        return GetPageRoute(
          popGesture: true,
          transition: Transition.rightToLeft,
          transitionDuration: const Duration(milliseconds: 250),
          settings: const RouteSettings(name: ContactDetailsScreen.routeName),
          page: () => ContactDetailsScreen(
            contact: contact,
          )
        );

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {

    return MaterialPageRoute(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              'Error',
              textScaleFactor: 1
            ),
          ),
          body: const Center(
            child: Text(
              'ERROR',
              textScaleFactor: 1
            ),
          ),
        );
      }
    );

  }

}