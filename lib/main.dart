import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app.dart';
import 'core/logging/app_logger.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  AppLogger.init();
  AppLogger.info('App started', tag: 'Main');
  runApp(const ProviderScope(child: App()));
}
