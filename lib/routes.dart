import 'package:flutter/material.dart';
import 'package:planner/screens/home_screen.dart';
import 'package:planner/screens/settings_screen.dart';
import 'package:planner/screens/notifications_screen.dart';
import 'package:planner/screens/records_screen.dart';
import 'package:planner/screens/transact_screen.dart';
import 'package:planner/screens/plan_details_screen.dart';

class AppRoutes {
  static const String initialRoute = '/';

  static final Map<String, WidgetBuilder> routes = {
    HomeScreen.routeName: (_) => const HomeScreen(),
    SettingsScreen.routeName: (_) => const SettingsScreen(),
    NotificationsScreen.routeName: (_) => const NotificationsScreen(),
    RecordsScreen.routeName: (_) => const RecordsScreen(),
    TransactScreen.routeName: (_) => const TransactScreen(),
    PlanDetailsScreen.routeName: (_) => const PlanDetailsScreen(),
  };

  static Route<dynamic> generateRoute(RouteSettings settings) {
    final builder = routes[settings.name];
    return MaterialPageRoute(
        builder: builder ?? (_) => _buildErrorRoute(settings));
  }

  static Widget _buildErrorRoute(RouteSettings settings) {
    return Scaffold(
      body: Center(
        child: Text('No route defined for ${settings.name}'),
      ),
    );
  }
}
