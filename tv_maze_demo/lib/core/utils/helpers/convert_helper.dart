import 'package:html/parser.dart';

class ConvertHelper {
  static String toPlainText(String? stringToConvert) {
    var text = parse(stringToConvert ?? "");
    final String parsedString =
        parse(text.body?.text).documentElement?.text ?? "";
    return parsedString;
  }
}
