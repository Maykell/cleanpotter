import 'package:cleanpotter/injection_container.dart';
import 'package:cleanpotter/presentation/app.dart';
import 'package:flutter/material.dart';

void main() async {
  await initializeDependencies();
  runApp(const App());
}
