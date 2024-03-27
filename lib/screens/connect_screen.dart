import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:sport_tv_app/providers/socket_provider.dart';
import 'package:sport_tv_app/router/routes.dart';
import 'package:sport_tv_app/utils/utils.dart';

class ConnectScreen extends StatefulWidget {
  const ConnectScreen({super.key});

  @override
  State<ConnectScreen> createState() => _ConnectScreenState();
}

class _ConnectScreenState extends State<ConnectScreen> {
  String ipAddress = '';
  TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((_) async {
      ipAddress = await Utils.getIPAddress() ?? '';
      _controller = TextEditingController(text: ipAddress);
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sport Receiver app'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Your IP Address:'),
                const SizedBox(width: 10),
                SizedBox(
                  width: 200,
                  child: TextField(
                    controller: _controller,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () async {
                context
                    .read<SocketProvider>()
                    .connectToSocket(_controller.text, 8080);
                context.goNamed(Routes.matchDetails.name);
              },
              child: const Text('Connect'),
            ),
          ],
        ),
      ),
    );
  }
}
