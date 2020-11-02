
import 'dart:async' show Future;
import 'dart:core' show Map, String;
import 'dart:convert';
import 'dart:io';


Future<Map<String, String>> _loadCodeMap() async {
    return json.decode(await (new File('lib/cp949-to-unicode.json')).readAsString()).cast<String, String>();
}

var codeMap = _loadCodeMap();

Future<String> toUtf8Code(String cp949Code) async {
    return (await codeMap)[cp949Code];
}