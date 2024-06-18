import 'package:flutter/material.dart';
import 'package:todo_app/common/app/app.dart';
import 'package:todo_app/common/injection/dependency_injection.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initializeDependencies();
  runApp(const App());
}

