// ignore: depend_on_referenced_packages
// ignore_for_file: file_names

import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';

StepDefinitionGeneric whenIPressButton() {
  return when<FlutterWorld>(
    'I Navigate to home',
    (context) async {
      final finder = context.world.appDriver.findBy('btnLogin', FindType.key);
      await context.world.appDriver.tap(finder);
    },
  );
}
