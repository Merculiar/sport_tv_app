import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:sport_tv_app/providers/socket_provider.dart';
import 'package:sport_tv_app/router/routes.dart';

class ConnectScreen extends StatelessWidget {
  const ConnectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sport Receiver app'),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            context
                .read<SocketProvider>()
                .connectToSocket('192.168.3.36', 8080);
            context.goNamed(Routes.matchDetails.name);
          },
          child: const Text('Connect'),
        ),
      ),
    );
  }
}
