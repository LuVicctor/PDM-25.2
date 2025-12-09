import 'package:flutter/material.dart';

class UserModel extends ChangeNotifier {
  String _username = '';

  String get username => _username;

  void login(String name) {
    _username = name;
    notifyListeners(); // Avisa quem estiver ouvindo que o nome mudou
  }
}
