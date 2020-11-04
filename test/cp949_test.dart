import 'package:test/test.dart';
import 'package:cp949/cp949.dart' as cp949;

void main() {
  test('decode() converts cp949 byte code units to native String.', () {
    expect(cp949.decode([0xBE, 0xC6, 0xB8, 0xA7, 0xB4, 0xD9, 0xBF, 0xEE]),
        equals("아름다운"));
  });

  test(
      'decodeString() converts broken String of cp949 byte code units to native String.',
      () {
    expect(cp949.decodeString("ÄÁÅÙÃ÷"), equals("컨텐츠"));
  });

  test('encode() converts dart native String to cp949 byte code units.', () {
    expect(cp949.encode("아름다운"),
        equals([0xBE, 0xC6, 0xB8, 0xA7, 0xB4, 0xD9, 0xbf, 0xee]));
  });

  test(
      'encodeToString() converts dart native String to broken String of cp949 byte code units.',
      () {
    expect(cp949.encodeToString("컨텐츠"), equals("ÄÁÅÙÃ÷"));
  });

  test('Verify encode() and decode() are inverse functions.', () {
    const content = "123 abc !.,/? 春夏秋冬 아름다운 한글..";
    final cp949CodeUnits = cp949.encode(content);
    final decodedContent = cp949.decode(cp949CodeUnits);

    expect(decodedContent, equals(content));
  });

  test('Verify encodeToString() and decodeString() are inverse functions.', () {
    const content = "123 abc !.,/? 春夏秋冬 아름다운 한글..";
    final brokenString = cp949.encodeToString(content);
    final decodedContent = cp949.decodeString(brokenString);

    expect(decodedContent, equals(content));
  });
}
