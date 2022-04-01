// ignore_for_file: avoid_print

import 'package:numerus/numerus.dart';

void main() {
  /// 1) Nice and easy, default config is the "common" config.

  var n = 418;
  print(n.toRomanNumeralString());
  // 'CDXVIII'

  var str = 'CDXVIII';
  print(str.isValidRomanNumeralValue());
  // true
  print(str.toRomanNumeralValue());
  // 418

  /// 2) You can specify other [RomanNumeralConfig]'s to change the style.
  /// You can set the config globally, if you'd like.
  RomanNumerals.romanNumeralsConfig = VinculumRomanNumeralsConfig();

  /// 3) Vinculum config style
  n = 3449671;
  print(n.toRomanNumeralString());
  // M̅M̅M̅C̅D̅X̅L̅MX̅DCLXXI

  str = 'M̅M̅M̅C̅D̅X̅L̅MX̅DCLXXI';
  print(str.isValidRomanNumeralValue());
  // true
  print(str.toRomanNumeralValue());
  // 3449671

  /// 4) You can specify the config inline, too.
  /// 5) Apostrophus style
  n = 2449671;
  print(n.toRomanNumeralString(config: ApostrophusRomanNumeralsConfig()));
  // CCCCIↃↃↃↃCCCCIↃↃↃↃCCCIↃↃↃIↃↃↃↃCCIↃↃIↃↃↃCIↃCCIↃↃIↃCLXXI

  /// 6) ... but frankly, globally set is probably the most common use case
  RomanNumerals.romanNumeralsConfig = ApostrophusRomanNumeralsConfig();

  str = 'CCCCIↃↃↃↃCCCCIↃↃↃↃCCCIↃↃↃIↃↃↃↃCCIↃↃIↃↃↃCIↃCCIↃↃIↃCLXXI';
  print(str.isValidRomanNumeralValue());
  // true
  print(str.toRomanNumeralValue());
  // 2449671

  /// 7) The compact Apostrophus style uses special Unicode characters
  /// just for these symbols.
  RomanNumerals.romanNumeralsConfig = CompactApostrophusRomanNumeralsConfig();
  n = 347449;
  print(n.toRomanNumeralString());
  // ↈↈↈↂↇↁↀↀCCCCXLIX

  str = 'ↈↈↈↂↇↁↀↀCCCCXLIX';
  print(str.isValidRomanNumeralValue());
  // true
  print(str.toRomanNumeralValue());
  // 347449

  /// 8) You can specify a "nulla" (zero placeholder) if you want
  /// to support zero easily.
  RomanNumerals.romanNumeralsConfig = CommonRomanNumeralsConfig(nulla: 'N');
  n = 0;
  print(n.toRomanNumeralString());
  // N

  str = 'N';
  print(str.isValidRomanNumeralValue());
  // true
  print(str.toRomanNumeralValue());
  // 0
}
