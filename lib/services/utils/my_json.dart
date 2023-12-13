import 'dart:convert';
import 'dart:typed_data';


class MyJson {
  static decode(Uint8List response) {
    return json.decode(utf8.decode(response));
  }
}
