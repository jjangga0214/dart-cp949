
import 'dart:async' show Future;
import 'dart:core' show Map, List, String, int;
import 'dart:convert';
import 'dart:io';

import 'src/cp949-to-unicode.dart' show codeMap;


List<int> toUtf8(List<int> codeUnits) {
    return null;
}

String toUtf8Code(String cp949Code) async { 
    return CODE_MAP[cp949Code];
}