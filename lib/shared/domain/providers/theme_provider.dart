import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shoppings_app/shared/utils/theme_data.dart';

part 'theme_provider.g.dart';

@riverpod
ThemeData theme(Ref ref) {
  return ThemeConfigs.themeData();
}
