import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/local/shared_prefs_storage_service.dart';

part 'shared_preferences_storage_service_provider.g.dart';

@riverpod
SharedPrefsService storageService(Ref ref) {
  final SharedPrefsService prefsService = SharedPrefsService();
  prefsService.init();
  return prefsService;
}
