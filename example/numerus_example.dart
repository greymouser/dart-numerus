import 'package:numerus/numerus.dart';

void main() {
  var n = 418;
  print(n.toRomanNumeralString());
  // 'CDXVIII'

  var str = 'CDXVIII';
  print(str.isValidRomanNumeral());
  // true
  print(str.toRomanNumeralValue());
  // 418
}
