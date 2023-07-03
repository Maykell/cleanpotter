import 'package:cleanpotter/presentation/routes/app_routes.dart';
import 'package:flutter/material.dart';

// Configurar screens / widgets
// Bloc (load characters)
// Configurar Injeção.

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'CleanPotter',
      theme: ThemeData.from(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.brown,
        ),
      ),
      routerConfig: AppRoutes.routerManager,
    );
  }
}
