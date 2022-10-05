import 'package:flutter/material.dart';
import 'package:get_it_demo/service_locator.dart';

import 'src/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setUpLocator();
  runApp(const MyApp());
}
