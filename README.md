# Numerus

Dart extensions for translating decimal numbers to Roman numerals and vice versa.

Negative numbers and numbers greater than 65535 are not supported. Functions will return null in place of generating nonsense,

![Coverage](https://raw.githubusercontent.com/{you}/{repo}/master/coverage_badge.svg?sanitize=true)

## Examples

```dart
import 'package:numerus/numerus.dart';

main() {
  var n = 418;
  print(n.toRomanNumeralString());
  // 'CDXVIII'

  var str = 'CDXVIII';
  print(str.isValidRomanNumeral());
  // true
  print(str.toRomanNumeralValue());
  // 418  
}
```

## Features and bugs

Please file feature requests and bugs at the [issue tracker][tracker].

[tracker]: https://github.com/greymouser/dart-numerus/issues

