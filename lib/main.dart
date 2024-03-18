import 'package:e_needs/app.dart';
import 'package:e_needs/di_injection.dart';
import 'package:flutter/material.dart';

import 'src/services/local/secure_storage.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  initGetIt();
  SharedPreference.init();
  runApp(const ENeeds());
}
