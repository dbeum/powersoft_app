import 'package:flutter/material.dart';

class LogoutPage {
  Future<void> logout(BuildContext context) async {
    print('Logging out...');
    Navigator.pushReplacementNamed(context, '/login');
  }
}
