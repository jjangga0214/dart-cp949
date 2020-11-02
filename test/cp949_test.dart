import 'dart:async';

import 'package:test/test.dart';
import 'package:cp949/cp949.dart' as cp949;

void main() {
  test('cp949.toUtf8Code() converts cp949 code unit to unicode unit.', () async {
    expect(await cp949.toUtf8Code('0x8141'), equals('0xAC02'));
  });
}