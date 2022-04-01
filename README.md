# Numerus

Dart extensions for translating decimal numbers to Roman numerals and vice versa.

* Negative numbers are not supported.
* Functions will return null in place of generating nonsense.
* Zero can be specified as an option to the RomanNumeralConfig.
* "Common" Roman numeral format used in modern times (i.e. MDCLXVI) is
  the default RomanNumeralConfig style. There are other styles: vinculum, apostrophus,
  and a compact apostrophus that uses single Unicode characters instead
  of tally marks. See the example below.

![Coverage](https://raw.githubusercontent.com/greymouser/dart-numerus/master/coverage_badge.svg?sanitize=true)

## Examples

```dart
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

```

## Features and bugs

Please file feature requests and bugs at the [issue tracker][tracker].

[tracker]: https://github.com/greymouser/dart-numerus/issues

## Local development
### Set up an environment for local development

* Install Dart or Flutter
* Install the `coverage` tool
  ```sh
  $ dart pub global activate coverage
  ```
* Install `lcov` on your system.
  e.g. macOS with brew:
  ```sh
  $ brew install lcov
  ```

### Generate code coverage from tests

```sh
$ ./bin/coverage-gen
# If you are on macOS and would like the report to immediately
# open, then run the following (not suitable for automation):
$ ./bin/coverage-gen -i
```
