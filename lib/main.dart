import 'package:complete_flutter_ecommerce/screens/login.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(primaryColor: Colors.deepOrange),
    home: ScreensController(),
  ));
}

class ScreensController extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Login();
  }
}
