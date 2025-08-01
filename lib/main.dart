import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:keep_notes_app/app/app_module.dart';
import 'package:keep_notes_app/app/app_widget.dart';

void main() => runApp(ModularApp(module: AppModule(), child: AppWidget()));
