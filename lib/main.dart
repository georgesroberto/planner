import 'package:flutter/material.dart';
import 'package:planner/providers/transaction_provider.dart';
import 'package:planner/providers/category_provider.dart';
import 'package:planner/providers/notification_provider.dart';
import 'package:planner/providers/theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:planner/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => TransactionProvider()),
        ChangeNotifierProvider(create: (_) => CategoryProvider()),
        ChangeNotifierProvider(create: (_) => NotificationProvider()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return MaterialApp(
            title: 'Planner',
            theme: themeProvider.getTheme,
            initialRoute: AppRoutes.initialRoute,
            onGenerateRoute: AppRoutes.generateRoute,
            debugShowCheckedModeBanner: false,
          );
        },
      ),
    );
  }
}
