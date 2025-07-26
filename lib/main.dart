import 'dart:convert';
import 'services/http_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';

import 'models/app_config.dart';
import 'pages/home_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  FlutterError.onError = (FlutterErrorDetails details) {
    FlutterError.presentError(details);
    print('Flutter Error: ${details.exception}');
    print(details.stack);
  };

  try {
    await loadConfig();
    runApp(const MyApp());
  } catch (e, stackTrace) {
    print('Main Function Error: $e');
    print(stackTrace);
  }
}

Future<void> loadConfig() async {
  try {
    // 1. Load configuration from assets
    String configContent = await rootBundle.loadString("assets/config/main.json");
    Map<String, dynamic> configData = jsonDecode(configContent);

    // 2. Register AppConfig first (HTTPService depends on it)
    GetIt.instance.registerSingleton<AppConfig>(
      AppConfig(COIN_API_BASE_URL: configData["COIN_API_BASE_URL"]),
    );

    // 3. ADD THIS: Register HTTPService after AppConfig is registered
    GetIt.instance.registerSingleton<HTTPService>(HTTPService());

    print('Services registered successfully'); // Optional: for debugging
  } catch (e) {
    print("Error loading config: $e");
    rethrow;
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CoinCap',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        scaffoldBackgroundColor: const Color.fromRGBO(130, 17, 49, 1),
      ),
      home: LayoutBuilder(
        builder: (context, constraints) {
          return Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 360),
              child: HomePage(),
            ),
          );
        },
      ),
    );
  }
}
