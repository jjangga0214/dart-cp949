import 'src/code_map.dart' show cp949ToUnicodeCodeMap, unicodeToCp949CodeMap;

List<int> toUnicodes(final List<int> codeUnits) {
  final List<int> unicodes = new List<int>.filled(codeUnits.length, 0);
  // new List(codeUnits.length);
  var j = 0;
  for (var i = 0; i < codeUnits.length; j++) {
    // When 1 byte becomes 1 cp949 code
    if (0x00 <= codeUnits[i] && codeUnits[i] <= 0x7F) {
      unicodes[j] = cp949ToUnicodeCodeMap[codeUnits[i]]!;
      i = i + 1;
    } else {
      // When 2 bytes become 1 cp949 code
      final cp949Code = (codeUnits[i] << 8) + codeUnits[i + 1];
      i = i + 2;
      if (0x8141 <= cp949Code && cp949Code <= 0xFDFE) {
        unicodes[j] = cp949ToUnicodeCodeMap[cp949Code]!;
      } else {
        throw FormatException(
            'Invalid code unit of CP949. It has to be (>=0x00 <=0x7F) || (>=0x8141 <=0xFDFE).');
      }
    }
  }
  return unicodes.sublist(0, j);
}

String decode(final List<int> codeUnits) {
  return String.fromCharCodes(toUnicodes(codeUnits));
}

String decodeString(final String brokenString) {
  return decode(brokenString.codeUnits);
}

/// Dart does not support non-unicode encoding.
/// Thus, the return value has to be raw byte array of CP949.
List<int> encode(final String str) {
  final cp949codeUnits = List<int>.filled(str.codeUnits.length * 2, 0);
  var i = 0;
  for (final unicode in str.codeUnits) {
    final cp949Code = unicodeToCp949CodeMap[unicode]!;
    final firstByte = cp949Code >> 8;
    final secondByte = cp949Code - (firstByte << 8);
    if (firstByte != 0) {
      cp949codeUnits[i] = firstByte;
      i = i + 1;
    }
    cp949codeUnits[i] = secondByte;
    i = i + 1;
  }
  return cp949codeUnits.sublist(0, i);
}

String encodeToString(final String str) {
  return String.fromCharCodes(encode(str));
}
