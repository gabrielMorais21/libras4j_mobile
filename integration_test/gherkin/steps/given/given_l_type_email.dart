import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';

StepDefinitionGeneric givenITypeTextEmail() {
  return given1<String, FlutterWorld>(
    'que escrevo email {string}',
    (value, context) async {
      final finder = context.world.appDriver.findBy('txtEmail', FindType.key);
      await context.world.appDriver.enterText(
        finder,
        value,
      );
    },
  );
}
