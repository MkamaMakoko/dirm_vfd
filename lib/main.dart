import 'package:dirm_vfd/ui/routes/router.dart';
import 'package:dirm_vfd/utils/_.dart';
import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter().then((_) async {
    await Hive.openBox('user');
  });
  runApp(const ProviderScope(child: MyApp()));
}

final _router = AppRouter();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return DynamicColorBuilder(builder: (light, dark) {
      const seedColor = Colors.cyan;
      const useMaterail3 = true;
      return MaterialApp.router(
        title: appTitle,
        themeMode: ThemeMode.system,
        theme: ThemeData(
            useMaterial3: useMaterail3,
            colorScheme: light ?? ColorScheme.fromSeed(seedColor: seedColor)),
        darkTheme: ThemeData(
            useMaterial3: useMaterail3,
            brightness: Brightness.dark,
            colorScheme: dark ??
                ColorScheme.fromSeed(
                    seedColor: seedColor, brightness: Brightness.dark)),
        routerConfig: _router.config(),
      );
    });
  }
}
