import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:sport_tv_app/services/encrypt_service.dart';

class SocketProvider extends ChangeNotifier {
  int _scoreA = 0;
  int get scoreA => _scoreA;
  set scoreA(int newValue) {
    if (newValue != _scoreA) {
      _scoreA = newValue;
      notifyListeners();
    }
  }

  int _scoreB = 0;
  int get scoreB => _scoreB;
  set scoreB(int newValue) {
    if (newValue != _scoreB) {
      _scoreB = newValue;
      notifyListeners();
    }
  }

  String _information = 'This is great battle between Team1 and Team2';
  String get information => _information;
  set information(String newValue) {
    if (newValue != _information) {
      _information = newValue;
      notifyListeners();
    }
  }

  Socket? _socket;

  String get matchScore => '$scoreA:$scoreB';

  Future<void> connectToSocket(String ipAddress, int port) async {
    try {
      _socket = await Socket.connect(
        ipAddress,
        port,
        timeout: const Duration(seconds: 5),
      );
      _socket?.listen((List<int> data) {
        String jsonString = utf8.decode(data);
        var jsonData = EncryptService.decryptJson(jsonString);
        information = jsonData['information'];
        scoreA = jsonData['scoreA'];
        scoreB = jsonData['scoreB'];
        notifyListeners();
        debugPrint('Received JSON data: $jsonData');
      });

      debugPrint('Socket connected successfully');
    } catch (e) {
      debugPrint('Error in socket connection');
    }
  }
}
