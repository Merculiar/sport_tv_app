import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:sport_tv_app/router/app_router.dart';

import 'providers/socket_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<SocketProvider>(
          create: (_) => SocketProvider(),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: goRouter,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.indigo),
      ),
    );
  }
}
