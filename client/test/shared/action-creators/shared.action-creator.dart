import 'package:test/test.dart';

import 'package:smartpeople_client/redux/index.dart';
import 'package:smartpeople_client/shared/index.dart';

class SharedActionCreatorTests {
  static run() {
    group('Shared action', () {
      test('Should return save email action', () {
        String email = 'test@test.com';
        Action result = SharedActionCreator.saveEmail(email);
        expect(result.type, SAVE_EMAIL);
        expect(result.data, {'email': email});
      });
    });
  }
}

void main() {
  SharedActionCreatorTests.run();
}
