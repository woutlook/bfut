import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final brightnessProvider = StateProvider<Brightness>((ref) {
  return Brightness.light;
});

// final themeModeProvider = Provider<ThemeMode>((ref) {
//   return ref.watch(brightnessProvider)== Brightness.light
//       ? ThemeMode.light
//       : ThemeMode.dark;
// }); 