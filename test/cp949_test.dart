import 'package:test/test.dart';
import 'package:cp949/cp949.dart' as cp949;

void main() {
  test('cp949.decode() converts cp949 byte code units to native String.', () {
    expect(cp949.decode([0xBE, 0xC6, 0xB8, 0xA7, 0xB4, 0xD9, 0xbf, 0xee]),
        equals("아름다운"));
  });

  test('cp949.encode() converts dart native String to cp949 byte code units.',
      () {
    expect(cp949.encode("아름다운"),
        equals([0xBE, 0xC6, 0xB8, 0xA7, 0xB4, 0xD9, 0xbf, 0xee]));
  });
}
