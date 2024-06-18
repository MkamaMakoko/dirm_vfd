import 'package:dirm_vfd/ui/routes/router.dart';
import 'package:dirm_vfd/utils/_.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter().then((_) async {
    await Hive.openBox(hiveKeys.user);
    await Hive.openBox(hiveKeys.items);
    await Hive.openBox(hiveKeys.customers);
  });
  runApp(const ProviderScope(child: MyApp()));
}

final _router = AppRouter();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const seedColor = Colors.cyan;
    const useMaterial3 = true;
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: appTitle,
      themeMode: ThemeMode.system,
      theme: ThemeData(
          useMaterial3: useMaterial3,
          colorScheme: ColorScheme.fromSeed(seedColor: seedColor)),
      darkTheme: ThemeData(
          useMaterial3: useMaterial3,
          brightness: Brightness.dark,
          colorScheme: ColorScheme.fromSeed(
              seedColor: seedColor, brightness: Brightness.dark)),
      routerConfig: _router.config(),
    );
  }
}
