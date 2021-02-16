import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main () {
  FlutterDriver driver;
  //final textButton = find.byValueKey('textButtonKey');
  final findButtonWithAncestor = find.ancestor(of: find.text('Second'), matching: find.byType('TextButton'));
  final findButtonWithDescendant = find.descendant(of: find.byType('ListView'), matching: find.byType('TextButton'));


  setUpAll(() async {
    driver = await FlutterDriver.connect();
  });


  tearDownAll(() async {
    if (driver != null) {
      driver.close();
    }
  });


  group('Trying to tap TextButton', (){
    test('Tapping Button With Ancestor', () async {
      await driver.tap(findButtonWithAncestor);
    });

    test('Tapping Button With Descendant', () async {
      await driver.tap(findButtonWithDescendant);
    });
  });

}