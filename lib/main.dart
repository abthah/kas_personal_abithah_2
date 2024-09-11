import 'package:flutter/material.dart';
import 'package:kas_personal/providers/kas_providers.dart';
import 'package:kas_personal/router.dart';
import 'package:kas_personal/theme.dart';
import 'package:provider/provider.dart';

void main() {
runApp(
  MultiProvider(
    providers:[ 
    ChangeNotifierProvider(
      create: (context) => KasProviders(),
      ),
    ],
    child: const App(),
  ),    
);
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: theme,
      routerConfig: router,
    );
  }
}